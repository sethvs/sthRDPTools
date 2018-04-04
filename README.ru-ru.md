# sthRDPTools

**sthRDPTools** - это модуль, содержащий пять функций для включения/отключения доступа по RDP как на локальном, так и на удаленных компьютерах, а также для активации/деактивации требования проверки подлинности на уровне сети (Network Level Authentication).

В модуль входят следующие функции:

[**Get-sthRDPConnectionsSetting**](#get-sthrdpconnectionssetting) — Функция для проверки настроек - включен ли удаленный доступ по RDP и требуется ли Network Level Authentication.

[**Enable-sthRDPConnections**](#enable-sthrdpconnections) — Функция включает удаленный доступ по RDP к указанным компьютерам и активирует соответствующие правила брандмауэра Windows.

[**Disable-sthRDPConnections**](#disablesthrdpconnections) — Функция отключает удаленный доступ по RDP к указанным компьютерам и деактивирует соответствующие правила брандмауэра Windows.

[**Enable-sthRDPNetworkLevelAuthentication**](#enable-sthrdpnetworklevelauthentication) — Функция активирует требование проверки подлинности на уровне сети (Network Level Authentication) для подключений по протоколу RDP.

[**Disable-sthRDPNetworkLevelAuthentication**](#disable-sthrdpnetworklevelauthentication) — Функция деактивирует требование проверки подлинности на уровне сети (Network Level Authentication) для подключений по протоколу RDP.

Вы можете установить модуль sthRDPTools из PowerShell Gallery:

```
Install-Module sthRDPTools
```

## Как с этим работать?

### Get-sthRDPConnectionsSetting

Эта команда показывает настройки локального компьютера:

```
Get-sthRDPConnectionsSetting
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

---

Эта команда показывает настройки указанных компьютеров:

```
Get-sthRDPConnectionsSetting -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                       True
comp2                      True                       True
comp3                      True                       True
```

### Enable-sthRDPConnections

Эта команда включает доступ по RDP и активирует соответствующие правила брандмауэра Windows на локальном компьютере:

```
Enable-sthRDPConnections
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

---

Эта команда включает доступ по RDP на локальном компьютере, но не изменяет правила брандмауэра:

```
Enable-sthRDPConnections -DontModifyFirewallException
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

---

Эта команда включает доступ по RDP и активирует соответствующие правила брандмауэра Windows на указанных компьютерах:

```
Enable-sthRDPConnections -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                       True
comp2                      True                       True
comp3                      True                       True
```

### Disable-sthRDPConnections

Эта команда отключает доступ по RDP и деактивирует соответствующие правила брандмауэра Windows на локальном компьютере:

```
Disable-sthRDPConnections
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                 False                       True
```

---

Эта команда отключает доступ по RDP на локальном компьютере, но не изменяет правила брандмауэра:

```
Disable-sthRDPConnections -DontModifyFirewallException
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                 False                       True
```

---

Эта команда отключает доступ по RDP и деактивирует соответствующие правила брандмауэра Windows на указанных компьютерах:

```
Disable-sthRDPConnections -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                     False                       True
comp2                     False                       True
comp3                     False                       True
```

### Enable-sthRDPNetworkLevelAuthentication

Эта команда активирует требование проверки подлинности на уровне сети (Network Level Authentication) для подключений по протоколу RDP на локальном компьютере:

```
Enable-sthRDPNetworkLevelAuthentication
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                       True
```

---

Эта команда активирует требование проверки подлинности на уровне сети (Network Level Authentication) для подключений по протоколу RDP на указанных компьютерах:

```
Enable-sthRDPNetworkLevelAuthentication -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                       True
comp2                      True                       True
comp3                      True                       True
```

### Disable-sthRDPNetworkLevelAuthentication

Эта команда деактивирует требование проверки подлинности на уровне сети (Network Level Authentication) для подключений по протоколу RDP на локальном компьютере:

```
Disable-sthRDPNetworkLevelAuthentication
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
localhost                  True                      False
```

---

Эта команда деактивирует требование проверки подлинности на уровне сети (Network Level Authentication) для подключений по протоколу RDP на указанных компьютерах:

```
Disable-sthRDPNetworkLevelAuthentication -ComputerName comp1, comp2, comp3
            
ComputerName AllowTSConnections NetworkLevelAuthentication
------------ ------------------ --------------------------
comp1                      True                      False
comp2                      True                      False
comp3                      True                      False
```
