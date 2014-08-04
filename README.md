# Mocks our VM migration

This is of course a simplification of our real world scenario but allows to test new migration rules etc ...

# Testing

```
./all.sh
```

# Folders

## `./in/`
Mock data, of data on the old supposed VM to be migrated

## `./out/`
Mock destination for migration

# Scripts

## `all.sh`
Runs both `tar.sh` and `test.sh`

## `tar.sh`
Creates `./in.tgz` from `./in/`, this targz, will be fed into `test.sh`

## `test.sh`
Boots up a mock HTTP server, imports the tar from there and migrates files according to rules

