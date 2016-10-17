## Notatki z Ruby, v2.3.1
### Tablice
 - tworzy się je przez podanie kilku elementów wewnątrz nawiasów kwadratowych
 
 ```ruby
 arr = [1, "lis", 7.0]
 Array.new
 => []
 ```
 ```ruby
 Array.new(3, 'lis')
 => ["lis", "lis", "lis"]
 ```
 ```ruby
 Array.new(3) = { Array.new(2, 'lis') }
 => [["lis", "lis"], ["lis", "lis"], ["lis", "lis"]]
 ```

 - mogą przyjmować obiekty różniące się typami
 - mogą być łączone (join) i dzielone (split)
 
 ```ruby
 arr = [1, 2, 3]
 tekst = arr.join(":")
 => "1:2:3"
 ```
 ```ruby
 tekst.split(":")
 => ["1", "2", "3"]
 ```

 - odniesienie się do części tablicy może odbyć się dzięki indeksom
 
 ```ruby
 arr = [1, 2, 3, 4, 5]
 arr[0..1]
 => [1, 2]
 ```
 ```ruby
 arr[-2]
 => 4 
 # (wartości ujemne oznaczają położenie w tablicy od końca)
 ```
 ```ruby
 arr[2, -2]
 => [3, 4]
 ```
 ```ruby
 arr.at(0)
 => 1
 ```
 ```ruby
 arr.first
 => 1
 ```
 ```ruby
 arr.last
 => 5
 ```
 ```ruby
 arr.take(3) # trzy od początku
 => [1, 2, 3]
 ```
 ```ruby
 arr.drop(3) # trzy od końca
 => [3, 4, 5]
 ```
 
 - unię dwóch tablic uzyskujemy tak: 
 
 ```ruby
 tab1 | tab2
 ```
 - część wspólną dwóch tablic:
 ```ruby
 tab1 & tab2
 ```
 - różnicę dwóch tablic:
 ```ruby
 tab1 - tab2
 ```
 - aby uzyskać informacje o tablicy możemy użyć:
 
 ```ruby
 browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
 browsers.length
 => 5
 ```
 ```ruby
 browsers.count
 => 5
 ```
 ```ruby
 browsers.empty?
 => false
 ```
 ```ruby
 browsers.include?('Klaudia')
 => false
 ```
 - aby dodać elementy możemy użyć poniższych poleceń
 
 ```ruby
 arr = [1, 2, 3, 4]
 arr.push(5)
 => [1, 2, 3, 4, 5]
 ```
 ```ruby
 arr << 6
 => [1, 2, 3, 4, 5, 6]
 ```
 ```ruby
 arr.unshift(0)
 => [0, 1, 2, 3, 4, 5, 6]
 ```
 ```ruby
 arr.insert(2, 2.45, 2.56, 2.98)
 => [1, 2, 2.45, 2.56, 2.98, 3, 4, 5, 6]
 ```

 - aby usunąć wybrane elementy można użyć następujących poleceń
 
```ruby
 arr = [1, 2, 3, 4, 5]
 arr.pop(5)
 => [1, 2, 3, 4]
 ```
 ```ruby
 arr.shift(1)
 => [2, 3, 4]
 ```
 ```ruby
 arr.delete_at(1)
 => [2, 4]
 ```
 ```ruby
 arr = [1, 2, 2, 3]
 arr.delete(2)
 => [1, 3]
 ```
 ```ruby
 arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
 arr.compact - pomijanie 'nil' bez zapisu
 => ['foo', 0, 'bar', 7, 'baz']
 ```
 ```ruby
 arr.compact! - pomijanie 'nil' z zapisem
 => ['foo', 0, 'bar', 7, 'baz']
 arr
 => ['foo', 0, 'bar', 7, 'baz']
 ```
 ```ruby
 arr = [1, 2, 2, 4, 5, 7, 7, 6, 7, 9]
 arr.uniq - pomijanie powtórzeń bez zapisu (arr.unique! - z zapisem)
 => [1, 2, 4, 5, 7, 6, 9]
 ```
 
 - iteracja po tablicy
 
 ```ruby
 arr = [1, 2, 3, 4, 5]
 arr.each { |liczba| print liczba -= 2, " " }
 => [-1, 0, 1, 2, 3]
 ```
 ```ruby
 slowa = %w[idzie lisek koło drogi]
 str = ""
 slowa.reverse_each { |slowa| str += "#{slowa} " }
 p str
 => "drogi koło idzie lisek "
 ```
 ```ruby
 arr.map { |a| 4*a }
 => [4, 8, 12, 16, 20]
 arr
 => [1, 2, 3, 4, 5]
 ```

 - wybieranie elementów:
 
  - bez zapisu
  
 ```ruby
 arr = [1, 2, 3, 4, 5, 6]
 arr.select { |a| a > 3 }
 => [4, 5, 6]
 ```
 ```ruby
 arr.reject { |a| a < 3 }
 => [3, 4, 5, 6]
 ```
 ```ruby
 arr.drop_while { |a| a < 4 }
 => [4, 5, 6]
 arr
 => [1, 2, 3, 4, 5, 6]
 ```

  - z zapisem
  
 ```ruby
 arr.delete_if { |a| a < 4 }
 => [4, 5, 6]
 arr
 => [4, 5, 6]
 ```
 ```ruby
 arr = [1, 2, 3, 4, 5, 6]
 arr.keep_if { |a| a < 4 }
 => [1, 2, 3]
 arr
 => [1, 2, 3]
 ```

- inne ciekawe opcje:

 ```ruby
 arr = [1, 2, 3, 4]
 arr.combination(2).to_a
 => [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
 ```
 ```ruby
 arr = ["a", "b", "c"]
 arr.cycle(2) { |x| puts x }
 => a, b, c, a, b, c
 ```
 ```ruby
 [1,2].product([3,4],[5,6])
 => [[1,3,5],[1,3,6],[1,4,5],[1,4,6],[2,3,5],[2,3,6],[2,4,5],[2,4,6]]
 ```
 ```ruby
 arr = [ "a", "b", "b", "b", "c" ]
 arr.index("b")
 => 1
 ```
 ```ruby
 arr.rindex("b")
 => 3
 ```
 ```ruby
 arr = [1, 2, 3, 4, 5]
 arr.rotate(2)
 => [3, 4, 5, 1, 2]
 arr.rotate(-2)
 => [4, 5, 1, 2, 3]
 ```
 ```ruby
 arr.sample(2)
 => [2,5]
 ```
 ```ruby
 arr = [ 1, 2, 3 ]
 => [1, 2, 3]
 arr.shuffle!
 => [2, 3, 1]
 arr
 => [2, 3, 1]
 ```

### Hash'e
 - inaczej tablice asocjacyjne lub słowniki
 - mają elementy, które są dostępne przez klucze mogące mieć wartość dowolnego rodzaju
 
```ruby
 h = {1 => 2, "2" => "4"}
 => {1=>2, "2"=>"4"}

 h[1]
 => 2

 h["2"]
 => "4"

 h[5]
 => nil
 ```
 
 - wartość domyślna
 
```ruby
 h = Hash.new("Lisek chytrusek")
 h["a"] = 100
 h["b"] = 200

 h["a"]
 => 100
 h["c"]
 => "Lisek chytrusek"

 h["c"].upcase!
 => "LISEK CHYTRUSEK"

 h["d"]
 => "LISEK CHYTRUSEK"

 h.keys
 => ["a", "b"]
 ```

 - kasowanie elementów słownika
 
```ruby
 h.delete 1
 => 2
 h[1]
 => nil
 ```

 - wyświetlanie każdego elementu
 
```ruby
 h = { "a" => 100, "b" => 200 }
 h.each {|key, value| puts "#{key} is #{value}" }

 a is 100
 b is 200

 h = { "a" => 100, "b" => 200 }
 h.each_key {|key| puts key }

 a
 b

 h = { "a" => 100, "b" => 200 }
 h.each_value {|value| puts value }

 100
 200
 ```

 - łączenie słowników
 
```ruby
 h1 = { "a" => 100, "b" => 200 }
 h2 = { "b" => 254, "c" => 300 }
 h1.merge(h2)
 => {"a"=>100, "b"=>254, "c"=>300}

 h1.merge(h2){|key, oldval, newval| newval - oldval}
 => {"a"=>100, "b"=>54,  "c"=>300}
 h1
 => {"a"=>100, "b"=>200}
 ```

 - dodawanie nowego klucza
 
```ruby
 h = { "a" => 100, "b" => 200 }
 h["a"] = 9
 h["c"] = 4

 h
 => {"a"=>9, "b"=>200, "c"=>4}

 h.store("d", 42)
 => 42
 h
 => {"a"=>9, "b"=>200, "c"=>4, "d"=>42}
 ```


### Enumerable
 - realizuje wiele metod, które wykorzystują metodę each do iterowania po elementach
 - index_by() - konwertuje na tablicę asocjacyjną
 - łączenie elementów w kawałki
 
```ruby
 [3,1,4,1,5,9,2,6,5,3,5].chunk { |n| n.even? }.each { |even, ary| p [even, ary] }

 [false, [3, 1]]
 [true, [4]]
 [false, [1, 5, 9]]
 [true, [2, 6]]
 [false, [5, 3, 5]]
 ```

 - szukanie pierwszego elementu spełniającego zadane warunki
 
```ruby
 (1..10).detect { |i| i % 2 == 0 and i % 3 == 1 }
 => 4
 ```

 - pętla
 
```ruby
 (1..5).cycle(2) { |a| print a.to_s+', ' }
 1, 2, 3, 4, 5, 1, 2, 3, 4, 5,
 ```

 - each_cons(n) - iteruje dany blok i zwraca n-elementowe
 
```ruby
 (1..5).each_cons(3) { |a| p a }

 [1, 2, 3]
 [2, 3, 4]
 [3, 4, 5]
 ```

 - each_slice(n) - dzieli blok na n-elementowe tablice
 
 ```ruby
 [1, 5, 8, 2, 1, 3, 8].each_slice(2) { |a| p a }

 [1, 5]
 [8, 2]
 [1, 3]
 [8]
 ```

 - grupowanie
 
 ```ruby
 (1..20).group_by { |i| i%5 }
 => {1=>[1, 6, 11, 16], 2=>[2, 7, 12, 17], 3=>[3, 8, 13, 18], 4=>[4, 9, 14, 19], 0=>[5, 10, 15, 20]}
 ```

 - slice_after(n) - dzielenie po wystąpieniu n
 
 ```ruby
 [1, 4, 7, 3, 4, 6].slice_after(4).to_a
 => [[1, 4], [7, 3, 4], [6]]
 ```

 - slice_when {|elt_before, elt_after| bool }
 
```ruby
 a = [3, 11, 14, 25, 28, 29, 29, 41, 55, 57]
 p a.slice_when {|i, j| j%i > 3 }.to_a
 => [[3, 11, 14], [25, 28, 29, 29], [41], [55, 57]]
 ```

 - sort_by
 
```ruby
 %w{lisek, kot, sowa}.sort_by { |word| word.length}
 => ["kot", "sowa", "lisek"]
 ```
