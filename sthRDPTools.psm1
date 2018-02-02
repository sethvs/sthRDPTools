<#
.externalhelp sthRDPTools.psm1-Help.xml
#>

function Get-sthRDPConnectionsSetting
{
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]]$ComputerName = 'localhost'
    )

    foreach ($comp in $ComputerName)
    {
        $TerminalServiceSetting = Get-CimInstance -ClassName Win32_TerminalServiceSetting -Namespace root/CIMV2/TerminalServices -CimSession $comp -ErrorAction SilentlyContinue
        $TSGeneralSetting = Get-CimInstance -ClassName Win32_TSGeneralSetting -Namespace root/CIMV2/TerminalServices -CimSession $comp -ErrorAction SilentlyContinue

        $Property = [ordered]@{ComputerName = $comp}
        if ($TerminalServiceSetting)
        {
            $Property.Add('AllowTSConnections', [bool]$TerminalServiceSetting.AllowTSConnections)
        }
        else
        {
            $Property.Add('AllowTSConnections', 'Inaccessible')
        }

        if ($TSGeneralSetting)
        {
            $Property.Add('NetworkLevelAuthentication', [bool]$TSGeneralSetting.UserAuthenticationRequired)
        }
        else
        {
            $Property.Add('NetworkLevelAuthentication', 'Inaccessible')
        }

        New-Object -TypeName PSCustomObject -Property $Property
    }
}


<#
.externalhelp sthRDPTools.psm1-Help.xml
#>

function Enable-sthRDPConnections
{
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns","")]
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]]$ComputerName = 'localhost',
        [switch]$DontModifyFirewallException
    )

    foreach ($comp in $ComputerName)
    {
        if ($DontModifyFirewallException)
        {
            Set-sthRDPConnections -ComputerName $comp -AllowTSConnections 1 -ModifyFirewallException 0
        }
        
        else
        {
            Set-sthRDPConnections -ComputerName $comp -AllowTSConnections 1 -ModifyFirewallException 1
        }
    }
}


<#
.externalhelp sthRDPTools.psm1-Help.xml
#>

function Disable-sthRDPConnections
{
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns","")]
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]]$ComputerName = 'localhost',
        [switch]$DontModifyFirewallException
    )

    foreach ($comp in $ComputerName)
    {
        if ($DontModifyFirewallException)
        {
            Set-sthRDPConnections -ComputerName $comp -AllowTSConnections 0 -ModifyFirewallException 0
        }
        
        else
        {
            Set-sthRDPConnections -ComputerName $comp -AllowTSConnections 0 -ModifyFirewallException 1
        }
    }
}


<#
.externalhelp sthRDPTools.psm1-Help.xml
#>

function Enable-sthRDPNetworkLevelAuthentication
{
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]]$ComputerName = 'localhost'
    )

    foreach ($comp in $ComputerName)
    {
        Set-sthRDPNetworkLevelAuthentication -ComputerName $comp -UserAuthenticationRequired 1
    }
}


<#
.externalhelp sthRDPTools.psm1-Help.xml
#>

function Disable-sthRDPNetworkLevelAuthentication
{
    Param(
        [Parameter(ValueFromPipeline)]
        [string[]]$ComputerName = 'localhost'
    )

    foreach ($comp in $ComputerName)
    {
        Set-sthRDPNetworkLevelAuthentication -ComputerName $comp -UserAuthenticationRequired 0
    }
}

function Set-sthRDPConnections
{
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns","")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions","")]
    Param(
        [Parameter(Mandatory)]
        [string]$ComputerName,
        [Parameter(Mandatory)]
        [ValidateRange(0,1)]
        [int]$AllowTSConnections,
        [Parameter(Mandatory)]
        [ValidateRange(0,1)]
        [int]$ModifyFirewallException
    )

    $TerminalServiceSetting = Get-CimInstance -ClassName Win32_TerminalServiceSetting -Namespace root/CIMV2/TerminalServices -CimSession $ComputerName -ErrorAction SilentlyContinue
    
    if ($TerminalServiceSetting)
    {
        $Arguments = @{
            AllowTSConnections = $AllowTSConnections
            ModifyFirewallException = $ModifyFirewallException
        }

        $Result = Invoke-CimMethod -InputObject $TerminalServiceSetting -MethodName SetAllowTSConnections -Arguments $Arguments -CimSession $ComputerName
        
        if ($Result.ReturnValue -eq 0)
        {
            Get-sthRDPConnectionsSetting -ComputerName $ComputerName
        }
        
        else
        {
            $Property = [ordered]@{
                ComputerName = $ComputerName
                AllowTSConnections = 'Failed'
                NetworkLevelAuthentication = ''
            }
            New-Object -TypeName PSCustomObject -Property $Property
        }
    }
    else
    {
        $Property = [ordered]@{
            ComputerName = $ComputerName
            AllowTSConnections = 'Inaccessible'
            NetworkLevelAuthentication = 'Inaccessible'
        }
        New-Object -TypeName PSCustomObject -Property $Property
    }
}

function Set-sthRDPNetworkLevelAuthentication
{
    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions","")]
    Param(
        [Parameter(Mandatory)]
        [string]$ComputerName,
        [Parameter(Mandatory)]
        [ValidateRange(0,1)]
        [int]$UserAuthenticationRequired
    )

        
    $TSGeneralSetting = Get-CimInstance -Namespace root/CIMV2/TerminalServices -ClassName Win32_TSGeneralSetting -CimSession $ComputerName -ErrorAction SilentlyContinue
    
    if ($TSGeneralSetting)
    {
        $Arguments = @{UserAuthenticationRequired = $UserAuthenticationRequired}

        $Result = Invoke-CimMethod -InputObject $TSGeneralSetting -MethodName SetUserAuthenticationRequired -Arguments $Arguments -CimSession $ComputerName

        if ($Result)
        {
            Get-sthRDPConnectionsSetting -ComputerName $ComputerName
        }

        else
        {
            $Property = [ordered]@{
                ComputerName = $ComputerName
                AllowTSConnections = ''
                NetworkLevelAuthentication = 'Failed'
            }
            New-Object -TypeName PSCustomObject -Property $Property
        }
    }

    else
    {
        $Property = [ordered]@{
            ComputerName = $ComputerName
            AllowTSConnections = 'Inaccessible'
            NetworkLevelAuthentication = 'Inaccessible'
        }
        New-Object -TypeName PSCustomObject -Property $Property
    }
}
