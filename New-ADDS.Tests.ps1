Describe "VM" {

    BeforeAll {
        $jsonfile = Get-Content ./vars.json -Raw
        $json = ConvertFrom-Json -InputObject $jsonfile
        $HyperVCredPath = $json.HyperVCredPath
        $VMName = $json.VMName
        $systemDiskPath = $json.systemDiskPath
        $ADDBDiskPath = $json.ADDBDiskPath
        #$cred = Import-Clixml -Path $HyperVCredPath
        #$session = New-PSSession -ComputerName $VMName -Credential $cred
    }

    AfterAll {
        #$session | Remove-PSSession
    }

    Context "Disks" {
        
        It "system VHDX in the expected location" {
            $systemDiskPath | Should -Exist
        }

        It "ADDB VHX in the expected location" {
            $ADDBDiskPath | Should -Exist
        }
    }
}
