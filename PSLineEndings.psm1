$bin = Join-Path -Path $PSScriptRoot -ChildPath bin
$unix2dos = Join-Path -Path $bin -ChildPath unix2dos.exe
$dos2unix = Join-Path -Path $bin -ChildPath dos2unix.exe

<#
.SYNOPSIS
Converts a files line endings from Unix to Dos

.DESCRIPTION
Changes all line endings in the file from LF to CRLF

.PARAMETER Filter
The file filter

.PARAMETER Recurse
Whether or not to recurse through sub-directories

.EXAMPLE
ConvertTo-Dos *.js -Recurse
#>
function ConvertTo-Dos { 
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$True,Position=0)]
        [string]$Filter, 
        [switch]$Recurse
    ) 
    PROCESS {
        Get-ChildItem -File @psBoundParameters | ForEach-Object { 
            $return = Start-Process -FilePath "`"$unix2dos`"" -ArgumentList "`"$($_.FullName)`"" -NoNewWindow -Wait -PassThru
        }
    }
}

<#
.SYNOPSIS
Converts a files line endings from Dos to Unix

.DESCRIPTION
Changes all line endings in the file from CRLF to LF

.PARAMETER Filter
The file filter

.PARAMETER Recurse
Whether or not to recurse through sub-directories

.EXAMPLE
ConvertTo-Unix *.js -Recurse
#>
function ConvertTo-Unix { 
    [CmdletBinding()]
    param (
        [parameter(Mandatory=$True,Position=0)]
        [string]$Filter, 
        [switch]$Recurse
    ) 
    PROCESS {
        Get-ChildItem -File @psBoundParameters | ForEach-Object { 
            $return = Start-Process -FilePath "`"$dos2unix`"" -ArgumentList "`"$($_.FullName)`"" -NoNewWindow -Wait -PassThru
        }
    }
}

Export-ModuleMember -Function 'ConvertTo-*'