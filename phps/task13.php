<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
  <style>
    body {
      background: rgb(242, 217, 217);
      font-family: 'Montserrat', sans-serif;
      display: flex;
      justify-content: center;
      flex-direction: column;
    }

    h1 {
      margin: auto;
    }

    p {
      margin: 20px auto;
    }

    form {
      margin: 40px auto;
      width: 300px;
      display: flex;
      flex-direction: column;
    }

    input {
      margin-bottom: 30px;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      margin: 20px 0;
    }

    th,
    td {
      text-align: left;
      padding: 8px;
    }

    th {
      background-color: rgb(250, 130, 220);
    }

    tr:nth-child(even) {
      background-color: rgb(250, 200, 220);
    }
  </style>
</head>

<body>
  <h1><a href="index.php">Повернутись до головної</a></h1>
  <p>Отримати склад підлеглих зазначеного бригадира, майстра тощо.</p>

  <form method="get" action="">
    <label for="type">Посада робітника:</label>
    <select name="type" id="type">
      <option value="brigadir">Бригадир</option>
      <option value="master">Майстер</option>
      <option value="director">Начальник цеха</option>
    </select>
    <label for="type">ID робітника</label>
    <input type="text" id="worker" name="worker">
    <button type="submit" name="submit">Пошук</button>
  </form>
  <?php
  require_once 'connection.php';
  $link = mysqli_connect($host, $user, $password, $database)
    or die("Помилка" . mysqli_error($link));
  if (isset($_GET['submit'])) {

    // отримуємо значення полів форми
    $worker = htmlentities(mysqli_real_escape_string($link, $_GET['worker']));
    $type = htmlentities(mysqli_real_escape_string($link, $_GET['type']));

    if ($type == "brigadir") {
      $sql = "SELECT id, name, brigada, speciality
      FROM (
        SELECT s.id, s.name, s.brigada, s.speciality
        FROM staff s
        LEFT JOIN brigada b ON s.brigada = b.id
        WHERE b.brigadir = $worker  AND s.id <> $worker 
        
        UNION
        
        SELECT d.id, d.name, d.brigada, 'Водій' AS speciality
        FROM driver d
        LEFT JOIN brigada b ON d.brigada = b.id
        WHERE b.brigadir = $worker 
      ) AS merged_staff;";

    } elseif($type == "master") {
      $sql = "SELECT id, name, brigada, speciality
      FROM (
        SELECT s.id, s.name, s.brigada, s.speciality
        FROM staff s
        LEFT JOIN brigada b ON s.brigada = b.id
        WHERE b.master = $worker AND s.id <> $worker 
        
        UNION
        
        SELECT d.id, d.name, d.brigada, 'Водій' AS speciality
        FROM driver d
        LEFT JOIN brigada b ON d.brigada = b.id
        WHERE b.master = $worker 
      ) AS merged_staff;";
    }
    elseif($type == 'director') {
      $sql = "SELECT id, name, brigada, speciality
      FROM (
        SELECT s.id, s.name, s.brigada, s.speciality
        FROM staff s
        LEFT JOIN brigada b ON s.brigada = b.id
        LEFT JOIN garage g ON b.garage = g.id
        WHERE g.director = $worker 
        
        UNION
        
        SELECT d.id, d.name, d.brigada, 'Водій' AS speciality
        FROM driver d
        LEFT JOIN brigada b ON d.brigada = b.id
        LEFT JOIN garage g ON b.garage = g.id
        WHERE g.director = $worker 
      ) AS merged_staff;";
    }
    $result = mysqli_query($link, $sql);

    // виводимо результати запиту
    echo '<h2>Результати пошуку:</h2>';
    $rows = mysqli_num_rows($result);
    echo "Знайдено записів: " . $rows;
    if (mysqli_num_rows($result) > 0) {
      echo "<table>";
      echo "<tr><th>ID Працівника</th><th>Робітник</th><th>ID Бригади</th><th>Спеціальність</th>";
      for ($i = 0; $i < $rows; ++$i) {
        $row = mysqli_fetch_row($result);
        echo "<tr>";

        for ($j = 0; $j < 4; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
      }
      echo "</table>";
      mysqli_free_result($result);
    } else {
      echo "No results found.";
    }

    // закриваємо з'єднання з базою даних
    mysqli_close($link);
  }
  ?>


</body>

</html>