# VirtualBox and Mongodb - AVX and AVX2

To use `mongodb` in my `VirtualBox` running inside a Windows Machine, I had to enable the use of AVX, as well as setup a Bridged Adapter as my Networking configuration.[^1]

Setting up `Bridged Adapter`:
`Virtualbox > Settings for the Linux Virtual Machine > Network > NAT to Bridge Adaptor`.

Setting up the AVX:
- Inside the host Windows Machine.
- Win+x.
- Select to run a Terminal as Administrator.
- Issue the following commands:
- `bcdedit /set hypervisorlaunchtype off`
* `DISM /Online /Disable-Feature:Microsoft-Hyper-V`

[^1]: https://stackoverflow.com/questions/65780506/how-to-enable-avx-avx2-in-virtualbox-6-1-16-with-ubuntu-20-04-64bit
