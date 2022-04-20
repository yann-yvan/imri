<?php


require __DIR__ . "/Controller.php";
require __DIR__ . "./../Models/Employee.php";
require __DIR__ . "./../Models/Task.php";
require __DIR__ . "./../Models/Operation.php";

class ListingController extends Controller
{
    public function dates()
    {
        $months = Task::raw("SELECT date_format(start_at, '%M-%Y') as month from tasks group by date_format(start_at, '%M-%Y')");
        $links = [];
        foreach ($months as $month) {
            array_push($links, '<li><a href="http://localhost:8000/api/employee?month=' . $month["month"] . '">' . $month["month"] . '</a>');
        }

        return "<h3>Cliquer sur un mois</h3><ul>" . join(" ", $links) . "</ul>";
    }

    public function employees()
    {
        $date = $_REQUEST["month"];
        $employees = Employee::raw("select employees.* from employees INNER JOIN tasks on employees.id = tasks.employee_id where date_format(tasks.start_at, '%M-%Y') like '" . $date . "' group by employee_id");
        $links = [];

        foreach ($employees as $employee) {
            array_push($links, '<li><a href="http://localhost:8000/api/detail?employee=' . $employee["id"] . '&month=' . $date . '">' . $employee["lastname"] . " " . $employee["firstname"] . '</a>');
        }

        return "<h3>Employés ayant travailler au mois de <u style='color: green'>$date</u></h3><ul>" . join(" ", $links) . "</ul>" . '<a href="http://localhost:8000">Retour</a>';
    }

    public function detail()
    {
        $employeeId = $_REQUEST["employee"];
        $date = $_REQUEST["month"];
        $employee = Employee::raw("select * from employees where id like '$employeeId'")[0];

        if (empty($employee)) {
            return '<h1>Oops aucun résultats</h1><br><a href="http://localhost:8000">Retour</a>';
        }
        $name = $employee["lastname"] . " " . $employee["firstname"];

        $salary = Task::raw("select sum(salary) as total from tasks where date_format(tasks.start_at, '%M-%Y') like '$date' and employee_id like '$employeeId'")[0];
        if (empty($salary)) {
            return '<h1>Oops probleme de calcul de salaire</h1><br><a href="http://localhost:8000">Retour</a>';
        }
        $employee["salary"] = $salary["total"];

        $tasks = Task::raw("select operation_id,name, hourly, sum(salary) AS total_salary, sum(TIMESTAMPDIFF(HOUR , start_at, end_at)) as total_hours from tasks INNER JOIN operations o on tasks.operation_id = o.id where date_format(tasks.start_at, '%M-%Y') like '$date' and employee_id like '$employeeId' group by operation_id");
        if (empty($tasks)) {
            return '<h1>Oops probleme de listing des tâches</h1><br><a href="http://localhost:8000">Retour</a>';
        }
        $employee["tasks"] = $tasks;

        echo "<style>pre {outline: 1px solid #ccc; padding: 5px; margin: 5px; }
.string { color: green; }
.number { color: darkorange; }
.boolean { color: blue; }
.null { color: magenta; }
.key { color: red; }</style>";

        $json = json_encode($employee, JSON_PRETTY_PRINT);

        $json = str_replace("&", "&amp;", $json);
        $json = str_replace("<", "&lt;", $json);
        $json = str_replace(">", "&gt;", $json);
        //$json = preg_replace_callback('/("(u[a-zA-Z0-9]{4}|\\[^u]|[^\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/', "format", $json);


        return "<h3>Salaire à payer pour le mois <u style='color: green'>$date</u> pour le compte de <u style='color: green'>$name</u> </h3><br/><pre>" . $json . '</pre><br><br><a href="http://localhost:8000">Retour</a>';
    }
}
