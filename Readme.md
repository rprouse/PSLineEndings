# PSLineEndings PowerShell Module

Sick of the dreaded `fatal: LF would be replaced by CRLF` when checking in files to Git?
There are the [unix2dos and dos2unix](http://dos2unix.sourceforge.net/), but they do not accept
[file globbing](http://man7.org/linux/man-pages/man7/glob.7.html), so you need to convert one
file at a time, or remember long incantations on the command line.

To make life easier, I created a small PowerShell module to allow me to convert files
recursively.

## Install

Download the contents of this repository to your PowerShell modules directory; 

```
C:\Users\[User]\Documents\WindowsPowerShell\Modules\PSLineEndings
``` 

Then add `Import-Module PSLineEndings` to your PowerShell profile;

```
C:\Users\[User]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

By default, PowerShell restricts execution of all scripts. This is all about security. To "fix" this run PowerShell as Administrator and call

```posh
Set-ExecutionPolicy RemoteSigned
```

For mode details run `get-help about_signing` or `get-help about_Execution_Policies`.

## Usage

### ConvertTo-Dos

```posh
ConvertTo-Dos -Filter *.txt -Recurse
```

### ConvertTo-Unix

```posh
ConvertTo-Unix -Filter *.txt -Recurse
```

## License

This code is under the [MIT License](LICENSE). This extension ships with `unix2dos.exe` and `dos2unix.exe`
which are both under the [FreeBSD style license](bin/COPYING.txt).

## Warning

First, I am not a PowerShell programmer, so my code may suck. Second, this is a
first release and not well tested. I am sure there are bugs. I will fix them as I find
them, so report issues.

