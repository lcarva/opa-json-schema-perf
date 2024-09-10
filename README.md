
```text
$opa eval --data . 'data.main.results' --profile --format=pretty
[
  [
    true,
    []
  ],
  [
    true,
    []
  ]
]
+------------------------------+-----------+
|            METRIC            |   VALUE   |
+------------------------------+-----------+
| timer_rego_load_files_ns     | 26615260  |
| timer_rego_module_compile_ns | 24751477  |
| timer_rego_module_parse_ns   | 26171100  |
| timer_rego_query_compile_ns  | 38743     |
| timer_rego_query_eval_ns     | 288952134 |
| timer_rego_query_parse_ns    | 37035     |
+------------------------------+-----------+
+--------------+----------+----------+--------------+-------------------+
|     TIME     | NUM EVAL | NUM REDO | NUM GEN EXPR |     LOCATION      |
+--------------+----------+----------+--------------+-------------------+
| 288.827434ms | 4        | 4        | 4            | main.rego:10      |
| 63.714µs     | 4        | 4        | 4            | main.rego:12      |
| 32.994µs     | 4        | 4        | 4            | main.rego:14      |
| 15.366µs     | 1        | 1        | 1            | data.main.results |
| 3.809µs      | 1        | 1        | 1            | main.rego:5       |
| 3.181µs      | 1        | 1        | 1            | schema.rego:3     |
| 2.385µs      | 1        | 1        | 1            | schema.rego:36    |
+--------------+----------+----------+--------------+-------------------+
```

