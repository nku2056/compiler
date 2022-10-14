
;; Function main (main, funcdef_no=0, decl_uid=2315, cgraph_uid=1, symbol_order=2)

main ()
{
  int f;
  int n;
  int i;
  int D.2324;

  scanf ("%d", &n);
  i = 2;
  f = 1;
  goto <D.2321>;
  <D.2320>:
  f = f * i;
  i = i + 1;
  <D.2321>:
  n.0_1 = n;
  if (i <= n.0_1) goto <D.2320>; else goto <D.2322>;
  <D.2322>:
  printf ("%d\n", f);
  D.2324 = 0;
  goto <D.2326>;
  <D.2326>:
  n = {CLOBBER};
  goto <D.2325>;
  D.2324 = 0;
  goto <D.2325>;
  <D.2325>:
  return D.2324;
}


