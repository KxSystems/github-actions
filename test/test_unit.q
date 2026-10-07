t: use `kx.test;
t.feature `mytest
t.assertTrue[{1b};::];
t.assertFalse[{0b};::];

failed: select from t.getReport[] where status <> `pass;
if[0<count failed;
  -1"\n\nTest failed!\n";
  0N!failed;
  exit 1;
  ];

exit 0;
