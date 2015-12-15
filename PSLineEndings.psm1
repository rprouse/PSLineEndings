$bin = Join-Path -Path $PSScriptRoot -ChildPath bin
$unix2dos = Join-Path -Path $bin -ChildPath unix2dos.exe
$dos2unix = Join-Path -Path $bin -ChildPath dos2unix.exe

function ConvertTo-Dos ($Filter, [switch]$Recurse) {
    Get-ChildItem -File @psBoundParameters | ForEach-Object { 
        $return = Start-Process -FilePath "`"$unix2dos`"" -ArgumentList "`"$($_.FullName)`"" -NoNewWindow -Wait -PassThru
    }
}

function ConvertTo-Unix ($Filter, [switch]$Recurse) {
    Get-ChildItem -File @psBoundParameters | ForEach-Object { 
        $return = Start-Process -FilePath "`"$dos2unix`"" -ArgumentList "`"$($_.FullName)`"" -NoNewWindow -Wait -PassThru
    }
}

Export-ModuleMember -Function 'ConvertTo-*'