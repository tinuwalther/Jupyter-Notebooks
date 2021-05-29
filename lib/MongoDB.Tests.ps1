<# Testplan MongoDB #>

BeforeAll{
    # -- Install MongoDB Module
    if(-not(Get-InstalledModule -Name Mdbc)){
        Install-Module -Name Mdbc
    }
    if(-not(Get-Module -Name Mdbc)){
        Import-Module -Name Mdbc
    }

    # -- Start containers
    function Start-Container($Name) {
        docker start $Name
    }
    # -- Start the mssqlsrv1 container to save the result
    Start-Container -Name 'mssqlsrv1'

    # -- Test docker image
    function Test-Image($Name){
        $result = docker image ls $Name 
        $string = $result[1].Trim() -split '\s+'
        $string -join ", "
    }

    # -- Test mongodb access
    function Get-ExposedPorts($Name){
        $arrport = (docker inspect --format='{{range $p, $conf := .Config.ExposedPorts}} {{$p}} {{end}}' $Name) -split '/'
        ($arrport -match '\d{2}').Trim()
    }

    function Test-MongoDbAccess($Name){
        $exposedPort = Get-ExposedPorts -Name $Name
        $result  = Invoke-WebRequest -Uri "http://localhost:$exposedPort"
        "$($result.StatusCode) $($result.StatusDescription)"
    }

    function Test-MongoDBDatabase($Name, $DB){
        $exposedPort = Get-ExposedPorts -Name $Name
        $mongo_databases = Connect-Mdbc mongodb://localhost:"$($exposedPort)" | Get-MdbcDatabase
        $result = $mongo_databases.DatabaseNamespace
        foreach($item in $result.DatabaseName){
            if($item -match $DB){
                $item 
            }
        }
    }
}

Describe "Test is the image on local docker repository" {
    it "The docker image 'mongo' should be on local repository" {
        (Test-Image -Name 'mongo') | Should -Match 'mongo'
    }
}

Describe "Test the status of the docker container" {
    it "The docker container 'mongodb1' is up and running" {
        (Start-Container -Name 'mongodb1') | Should -BeExactly 'mongodb1'
    }
}


Describe "Test the MongoDB port-mapping" {
    it "The MongoDB 'mongodb1' is accessible over http" {
        (Test-MongoDbAccess -Name 'mongodb1') | Should -BeExactly '200 OK'
    }
}

Describe "Test the MongoDB database" {
    it "The 'mongodb1' contains the admin database" {
        (Test-MongoDBDatabase -Name 'mongodb1' -DB 'admin') | Should -BeExactly 'admin'
    }
}