<?php
function parse_filename($contentDisposition)
{
    $filename = '';
    if (preg_match('/filename="([^"]+)"/', $contentDisposition, $matches))
	{
        $filename = trim($matches[1]);
    }
    return $filename;
}

function handle_upload($uploadDir)
{
	print ("</br>Upload Dir: $uploadDir");
	print ("</br>Upload Max Filesize: " . ini_get('upload_max_filesize'));
	print ("</br>Post Max Size: " . ini_get('post_max_size'));
	print ("</br>Max File Uploads: " . ini_get('max_file_uploads'));
	print ("</br>Upload Temp Dir: " . ini_get('upload_tmp_dir'));
	print ("</br>Max Input Time: " . ini_get('max_input_time'));
	print ("</br>Max Execution Time: " . ini_get('max_execution_time'));
	print ("</br>Memory Limit: " . ini_get('memory_limit'));
	print ("</br>File Uploads: " . ini_get('file_uploads'));
	print ("</br></br>");

	print ("</br>_FILES:");
	print_r($_FILES);
	print ("</br></br>");
	print ("</br>Erro no upload: " . $_FILES['filename']['error']);
	print ("</br>Nome do arquivo: " . $_FILES['filename']['name']);
	print ("</br>Nome temporário: " . $_FILES['filename']['tmp_name']);
	print ("</br>Tamanho do arquivo: " . $_FILES['filename']['size']);
	print ("</br>Tipo do arquivo: " . $_FILES['filename']['type']);

	if ($_SERVER['REQUEST_METHOD'] !== 'POST')
	{
		return "<p>Error: Invalid request method. Please use POST.</p>";
	}
	
    if (empty($_FILES['filename']))
	{
        return "<p>Error: No file uploaded...</p>";
    }

    $file = $_FILES['filename'];
	return "<p>Filename: $file</p>";
    $filename = parse_filename($file['name']);

    if (empty($filename))
	{
        return "<p>Error: Filename not found.</p>";
    }

    $fileExtension = pathinfo($filename, PATHINFO_EXTENSION);
    $filename = pathinfo($filename, PATHINFO_FILENAME) . '-' . uniqid() . '.' . $fileExtension;

    $filePath = $uploadDir . DIRECTORY_SEPARATOR . $filename;

    if (!move_uploaded_file($file['tmp_name'], $filePath)) {
        return "<p>Upload error: Failed to move uploaded file.</p>";
    }

    return "<p>201 - Created</p><h3>$filenamefilename has been uploaded successfully!</h3><h3>Go to the upload directory to see your file.</h3>";
}

function main()
{
//	phpinfo();

	// Define o diretório de upload
	$uploadDir = 'saving/';

    if (!is_dir($uploadDir) && !mkdir($uploadDir, 0777, true))
	{
        echo "<p>Error: Failed to create upload directory.</p>";
        exit;
    }

    $response = "<!DOCTYPE html><html><head><title>Upload</title><meta charset=\"UTF-8\" /><link rel=\"stylesheet\" href=\"../style.css\"></head>";
    $response .= "<body><header><nav><ul><li><a href=\"../index.html\">Home</a></li><li><a href=\"../about.html\">About Us</a></li>";
    $response .= "<li><a href=\"../upload.html\">Upload</a></li><li><a href=\"../contacts.html\">Contacts</a></li></ul></nav></header>";

    $response .= handle_upload($uploadDir);

    $response .= "<footer><p>&copy; 2024 Simple Site.</p></footer></body></html>";

    echo $response;
}

main();
?>