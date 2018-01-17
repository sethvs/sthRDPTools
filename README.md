# sthRDPTools

**sthRDPTools** - it is a module, containing five functions to enable/disable RDP connections on local and remote computers and to activate/deactivate Network Level Authentication requirement.

It contains following functions:

**Get-sthRDPConnectionsSetting** — Function checks whether RDP remote access is enabled and if Network Level Authentication is required.

**Enable-sthRDPConnections** — Function enables RDP access for specified computers and enables corresponding firewall rules.

**Disable-sthRDPConnections** — Function disables RDP access for specified computers and disables corresponding firewall rules.

**Enable-sthRDPNetworkLevelAuthentication** — Function enables Network Level Authentication requirement for RDP connections.

**Disable-sthRDPNetworkLevelAuthentication** — Function disables Network Level Authentication requirement for RDP connections.

You can install sthRDPTools module from PowerShellGallery:

```
Install-Module sthRDPTools
```