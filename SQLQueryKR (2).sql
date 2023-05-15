create login RiabkoTest with password = '1'
create login OlgaTest with password = '1'
use reiting
create user RiabkoTest for login RiabkoTest
create user OlgaTest for login OlgaTest

--ролі БД
alter role db_backupoperator add member OlgaTest
exec sp_helprolemember

--нова роль БД
--create role RiabkoTest authorization db_ddladmin
alter role db_ddladmin add member RiabkoTest
--alter role db_backupoperator drop member RiabkoTest


--дозволи для адміна
grant select to RiabkoTest
grant insert to RiabkoTest
grant delete to RiabkoTest

--дозволи для користувача
grant select to OlgaTest
revoke insert to OlgaTest
deny delete to OlgaTest


BACKUP DATABASE reiting
TO DISK = 'C:\Data base\Backup\Test_reiting.bak' 
WITH INIT, NAME = 'test backup',
DESCRIPTION ='test Full Db Backup'

RESTORE DATABASE reiting
FROM DISK = 'C:\Data base\Backup\Test_reiting.bak' 
WITH RECOVERY, REPLACE

