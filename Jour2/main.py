import functions_framework
from google.cloud import bigquery

@functions_framework.http
def upload_csv_to_bq(request):
    client = bigquery.Client()

    uri = "gs://my-bucket/olist_sample.csv"
    table_id = "my-project-id.dataset.olist_table"

    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV,
        skip_leading_rows=1,
        autodetect=True,
        write_disposition=bigquery.WriteDisposition.WRITE_APPEND,
    )

    load_job = client.load_table_from_uri(
        uri, table_id, job_config=job_config
    )

    load_job.result()

    return f"✅ CSV uploaded to {table_id}."