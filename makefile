run:
	@node index.js

sync:
	@git add --all
	@git diff
	@git commit --allow-empty -a -m "Auto Commit" -m "Who: `git config --get user.name`, `git config --get user.email`" -m "Where: `hostname`" -m "When: `date`"
	@git config pull.rebase false
	@git pull
	@git push origin

readsql:
	@sqlite3 data.db ".read schema.sql"

install:
	@npm i -s socket.io
	@npm i -s express
	@npm i -s express-session
	@npm i -s connect-sqlite3
	@npm i -s fs
	@npm i -s path

users:
	@sqlite3 data.db ".schema users"
	@sqlite3 data.db "SELECT * FROM users"

host:
	http-server http://localhost:8080

connect:
	@sqlite3 data.db

setup:
	@mkdir -p public
	@mkdir -p templates
	@mkdir -p static
	@touch README.md
	@touch .gitignore
	@touch index.js
	@touch templates/index.html
	@touch static/styles.css