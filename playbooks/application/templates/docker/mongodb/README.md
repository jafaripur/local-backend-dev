# MongoDB

### Create

```
./start.sh           
```

### Remove

Remove container. data is available and not deleted. After deleting container with starting, data also available.

```
./remove.sh
```

### Create user

We initialize MongoDB with replicaset and need to initialize replica before creating user.

### Connect to mongodb shell

with running `mongodb.sh` we can connect to MongoDB shell.

```
mongodb.sh

OR

mongodb.sh -u root -p
```

#### Create root user

```

rs.initiate({
	_id: "rs01",
	members: [
		{_id : 0, host : "localhost:27017"},
	]
});

//rs.secondaryOk();

use admin;

db.createUser({
  user:  'root',
  pwd: '123456',
  roles: [{
    role: 'root',
    db: 'admin'
  }]
});
```

#### Create backup and restore user

```

use admin;

db.auth("USERNAME", "PASSWORD");

db.createUser({
  user:  'user_backup',
  pwd: '1234',
  roles: [{
    role: 'backup',
    db: 'admin'
  }]
});

db.createUser({
  user:  'user_restore',
  pwd: '123',
  roles: [{
    role: 'restore',
    db: 'admin'
  }]
});

```

#### Create user for specific database

Create username and password for `test_db`

```
use admin;
db.auth("USERNAME", passwordPrompt());

use test_db;
db.createUser({
  user:  'test_user',
  pwd: '123456',
  roles: [{
    role: 'dbOwner',
    db: 'test_db'
  }]
});

```