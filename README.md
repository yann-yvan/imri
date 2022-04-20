# Imri Test

## Step
1. Setup
2. Launch
3. Enjoy


## 1- Setup
### Step 1 :
#### Clone project in your computer
```
git clone https://github.com/yann-yvan/imri-test
```

### Step 2:
#### install all dependencies from composer
```shell script
composer install
```
### Step 3:
#### Create a database on MySQL
```sql
CREATE SCHEMA IF NOT EXISTS `test_product_db` DEFAULT CHARACTER SET utf8 ;
```

### Step 4: Create .env file in projet root

##### On Linux base system

```shell script
cp .env.example .env
```

##### On Windows base system
```shell script
copy .env.example .env
```

##### Or create a file name .env and paste the above text
Replace theses value with your database credential


```dotenv
  DB_USERNAME=username
  DB_PASSWORD=password
```

The content to copy
```dotenv
  APP_NAME="Imri Test"
  APP_ENV=local
  APP_KEY=base64:q2FGYvLk5IYGRbjQPCBN8AtvdoWybtBEYEGatGbvA/Q=
  APP_DEBUG=true
  APP_URL=http://localhost:8000
  APP_TIMEZONE=UTC
  
  LOG_CHANNEL=stack
  LOG_SLACK_WEBHOOK_URL=
  
  DB_CONNECTION=mysql
  DB_HOST=127.0.0.1
  DB_PORT=3306
  DB_DATABASE=test_product_db
  DB_USERNAME=
  DB_PASSWORD=
  
  CACHE_DRIVER=file
  QUEUE_CONNECTION=sync
```
Install the database
```shell script
php artisan migrate:fresh
```

### grant permission to storage dir

##### On Linux base system

```shell script
sudo chmod -R a+rw storage/
```


## 2- Launch app
Run this in terminal
```shell script
php -S 127.0.0.1:8000 -t public 
 ```
Open your browser
```
http://localhost:8000
```    

## 3- Test and enjoy
