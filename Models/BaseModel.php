<?php


class BaseModel
{
    const DB_HOST = "127.0.0.1";
    const DB_PORT = "3306";
    const DB_DATABASE = "test_pratique_db";
    const DB_USERNAME = "root";
    const DB_PASSWORD = "root";
    private static $query;
    protected $table = '';
    private $connection;

    /**
     * BaseModel constructor.
     */
    public function __construct()
    {
        $this->connection = new PDO("mysql:host=" . self::DB_HOST . ";dbname=" . self::DB_DATABASE, self::DB_USERNAME, self::DB_PASSWORD);
        // set the PDO error mode to exception
        $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        error_log("SUCCESS");
    }

    public static function raw($query)
    {
        BaseModel::$query = $query;
        return self::get();
    }

    public static function get()
    {
        $model = self::boot();
        $stmt = $model->connection->prepare(BaseModel::$query);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        return $stmt->fetchAll();
    }

    public static function boot()
    {
        $class = basename(get_called_class());
        error_log($class);
        return new $class;
    }

    public static function all()
    {
        $model = self::boot();
        $stmt = $model->connection->prepare("SELECT * FROM $model->table");
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        return $stmt->fetchAll();
    }

    public static function where($key, $comparator, $value)
    {
        error_log(BaseModel::$query);
        BaseModel::$query = BaseModel::$query . " where $key $comparator $value";
        return self::get();
    }
}
