<!doctype html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Books</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div><b>List of authors</b></div>
    <?php
        $db = pg_connect("host=localhost dbname=aebi user=aebi password=aebi");
        $result = pg_query($db, "SELECT author_last_name, author_first_name FROM books;");
        while ($row = pg_fetch_row($result)) {
            $author_last_name = $row[0];
            $author_first_name = $row[1];
            echo $author_first_name . " " . $author_last_name . "<br/>";
        }
    ?>

    <div style="margin-top: 20px"><b>Add a book</b></div>
    <?php
        $parameters = array("Duck", "Dagobert", 1900, "My way");
        $result = pg_query_params($db, "INSERT INTO books (author_last_name, author_first_name, year, title) VALUES ($1, $2, $3, $4) RETURNING id;", $parameters);
        $row = pg_fetch_row($result);
        $inserted_id = $row[0];
        echo "Inserted ID: " . $inserted_id;
   ?>

    <div style="margin-top: 20px"><b>Modify a book</b></div>
    <?php
        $parameters = array("Duck", "Donald", 1900, "My way", $inserted_id);
        pg_query_params($db, "UPDATE books SET author_last_name=$1, author_first_name=$2, year=$3, title=$4 WHERE id=$5;", $parameters);
    ?>

    <div style="margin-top: 20px"><b>Delete a book</b></div>
    <?php
        $parameters = array($inserted_id);
        pg_query_params($db, "DELETE FROM  books WHERE id=$1;", $parameters);
    ?>
</body>

</html>