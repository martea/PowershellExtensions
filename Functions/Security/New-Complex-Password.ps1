
function New-ComplexPassword {
    <#
    .SYNOPSIS
    New-ComplexPassword Generator
    
    .DESCRIPTION
    New-ComplexPassword Generator tool to obtain any length and numbers of passwords, 
    adding desired number of special characters, quickly. 
    
    .PARAMETER PasswordLength
    Add a integer value for desired password length
    
    .PARAMETER SpecialCharCount
     Add a integer value for desired number of special characters
    
    .PARAMETER GenerateUserPW
    Enter as many named string or integer values 
    
    .EXAMPLE
    'John','Paul','George','Ringo' | New-ComplexPassword -PasswordLength 10 -SpecialCharCount 2
 
    1..5 | New-ComplexPassword
    #>
    
    [Cmdletbinding(DefaultParameterSetName = 'Single')]
    Param(
        [Parameter(ParameterSetName = 'Single')]
        [Parameter(ParameterSetName = 'Multiple')]
        [Int]
        $PasswordLength = 16,
        
        [Parameter(ParameterSetName = 'Single')]
        [Parameter(ParameterSetName = 'Multiple')]
        [int]
        $SpecialCharCount = 4,
 
        [Parameter(ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Multiple')]
        [String[]]
        $GenerateUserPW
    )
    Begin {   
        Add-Type -AssemblyName System.Web 
    }
    Process {
        switch ($PsCmdlet.ParameterSetName) {
            'Single' {
                [System.Web.Security.Membership]::GeneratePassword($PasswordLength, $SpecialCharCount)
            }
            'Multiple' {
                $GenerateUserPW | ForEach-Object {
                    New-Object -TypeName PSObject -Property @{
                        User     = $_
                        Password = [System.Web.Security.Membership]::GeneratePassword($PasswordLength, $SpecialCharCount)
                    }
                }
            }
        } 
    }
    End {}
}