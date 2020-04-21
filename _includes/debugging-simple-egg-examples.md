```
[.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/debug-special-form.egg
```
```ruby
if(true, 
  print(2), 
  print("not 2")
)
```

```
.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/string-apply-simple.egg 
```
```ruby
"hello"("length")
```

```
.../p6-t3-egg-1-04-16-2020-03-13-25/davafons(casiano)]$ cat examples/number-apply.egg 
```
```ruby
4("toFixed")(2)
```
