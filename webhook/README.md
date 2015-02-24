# Webhook

`receiver.php` will take in HTTP requests and dump all their headers and request body to data/timestamp.txt

Example output looks something like this:

```
Array
(
    [Content-Type] => application/json
    [Host] => ianduffy.ie
    [User-Agent] => EventMachine HttpClient
    [Content-Length] => 286
)




[{"meta":{"account":"municio","event":"presence"},"payload":{"id":679984432139993215,"connection_id":679984401475453049,"id_str":"679984432139993215","connection_id_str":"679984401475453049","asset":"356363050331521","time":"2015-02-20T09:35:14Z","type":"connect","reason":"idle_out"}}]
```
