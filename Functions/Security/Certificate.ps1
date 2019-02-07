Function New-MakeCert-Certificate {
    Param(
        [Parameter(ParameterSetName = 'Single', Mandatory = $true)]
        [string] $CommonName,
        [Parameter(ParameterSetName = 'Single', Mandatory = $true)]
        [string] $FileName
    )
    Begin {   
        # The System.Web namespaces contain types that enable browser/server communication
        Add-Type -AssemblyName System.Web 
    }
    Process {
        $password = [System.Web.Security.Membership]::GeneratePassword(16, 4) 
        $password | clip
        
        Write-Host "Generate password for certificate, save this password $password"
        makecert -n "CN=$CommonName" -a sha256 -sv "$FileName.pvk" -r "$FileName.cer"
        return $password
    }
    
}
function New-PFX-Certificate {
    Param(
        [Parameter(ParameterSetName = 'Single', Mandatory = $true)]
        [string] $CommonName,
        [Parameter(ParameterSetName = 'Single', Mandatory = $true)]
        [string] $FileName
    )
    $pwd = New-MakeCert-Certificate -CommonName $CommonName -FileName $FileName
    pvk2pfx -pvk "$FileName.pvk" -spc "$FileName.cer" -po "$pwd" -pfx "$FileName.pfx"
}