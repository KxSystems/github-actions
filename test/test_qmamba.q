/ Create and activate an environment, install q-kx-printf from the kx channel
/ and call printf from it.
qm:use `kx.qmamba;

envName:"gha_test_env";
qm.create envName;
qm.activate envName;
prefix:qm.active[];
-1 "Active environment: ",prefix;

/ q-kx-printf is a kx module, any dependencies come from conda-forge
qm.install (`SPECS`CHANNEL`YES`QUIET)!(enlist "q-kx-printf";("kx";"conda-forge");1;1);

printf:(use `kx.printf)`printf;
result:printf ("Hello %s, answer %d";`world;42);
-1 "printf: ",result;

failures:();
check:{[name;ok] if[not ok; failures,:enlist name]};

check["environment name is active";prefix like "*",envName];
check["printf output";result~"Hello world, answer 42"];
check["printf padding";(printf ("[%5d]";42))~"[   42]"];
check["module loaded from the environment";any (exec p from .Q.m.M) like prefix,"/lib/q/mod/*"];

if[count failures;
  -1"\n\nTest failed!\n";
  {-1 "  - ",x} each failures;
  exit 1;
  ];

-1 "All qmamba checks passed";
exit 0;
