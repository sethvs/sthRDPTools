# sthRDPTools

**sthRDPTools** - it is a module, containing five functions to enable/disable RDP connections on local and remote computers and to activate/deactivate Network Level Authentication requirement.

It contains following functions:

**Get-sthRDPConnectionsSetting** — Function checks whether RDP remote access is enabled and if Network Level Authentication is required.

**Enable-sthRDPConnections** — Function enables RDP access for specified computers and enables corresponding firewall rules.

**Disable-sthRDPConnections** — Function disables RDP access for specified computers and disables corresponding firewall rules.

**Enable-sthRDPNetworkLevelAuthentication** — Function enables Network Level Authentication requirement for RDP connections.

**Disable-sthRDPNetworkLevelAuthentication** — Function disables Network Level Authentication requirement for RDP connections.

You can install sthRDPTools module from PowerShell Gallery:

```
Install-Module sthRDPTools
```

## How to use it?

### Get-sthRDPConnectionsSetting

This command shows RDP settings on local computer:

```
Get-sthRDPConnectionsSetting
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

This command shows RDP settings on specified computers:

```
Get-sthRDPConnectionsSetting -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                       True
comp2                      True                       True
comp3                      True                       True
```

### Enable-sthRDPConnections

This command enables RDP connections and enables firewall exception on local computer:

```
Enable-sthRDPConnections
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

This command enables RDP connections on local computer, but don't modifies firewall exception.

```
Enable-sthRDPConnections -DontModifyFirewallException
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

This command enables RDP connections and enables firewall exceptions on specified computers.

```
Enable-sthRDPConnections -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                       True
comp2                      True                       True
comp3                      True                       True
```

### Disable-sthRDPConnections

This command disables RDP connections and disables firewall exception on local computer:

```
Disable-sthRDPConnections
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                 False                       True
```

This command disables RDP connections on local computer, but don't modifies firewall exception.

```
Disable-sthRDPConnections -DontModifyFirewallException
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                 False                       True
```

This command disables RDP connections and disables firewall exceptions on specified computers:

```
Disable-sthRDPConnections -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                     False                       True
comp2                     False                       True
comp3                     False                       True
```

### Enable-sthRDPNetworkLevelAuthentication

This command enables Network Level Authentication requirement for RDP connections on local computer.

```
Enable-sthRDPNetworkLevelAuthentication
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

This command enables Network Level Authentication requirement for RDP connections on specified computers.

```
Enable-sthRDPNetworkLevelAuthentication -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                       True
comp2                      True                       True
comp3                      True                       True
```

### Disable-sthRDPNetworkLevelAuthentication

This command disables Network Level Authentication requirement for RDP connections on local computer.

```
Disable-sthRDPNetworkLevelAuthentication
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                      False
```

This command disables Network Level Authentication requirement for RDP connections on specified computers.

```
Disable-sthRDPNetworkLevelAuthentication -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                      False
comp2                      True                      False
comp3                      True                      False
```