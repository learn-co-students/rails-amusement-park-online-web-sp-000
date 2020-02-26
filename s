
[1mFrom:[0m /home/trader/code/labs/rails-amusement-park-online-web-sp-000/app/models/ride.rb @ line 19 Ride#take_ride:

     [1;34m5[0m: [32mdef[0m [1;34mtake_ride[0m
     [1;34m6[0m:   message = [31m[1;31m"[0m[31mSorry. [1;31m"[0m[31m[0m
     [1;34m7[0m:   [32mif[0m [1;36mself[0m.user.tickets < [1;36mself[0m.attraction.tickets
     [1;34m8[0m:     message = message + [31m[1;31m"[0m[31mYou do not have enough tickets to ride the #{self.attraction.name}[0m[31m.[1;31m"[0m[31m[0m
     [1;34m9[0m:   [32melsif[0m
    [1;34m10[0m:     [1;36mself[0m.user.tickets = [1;36mself[0m.user.tickets - [1;36mself[0m.attraction.tickets
    [1;34m11[0m:     [1;36mself[0m.save
    [1;34m12[0m:   [32mend[0m
    [1;34m13[0m:   [32mif[0m [1;36mself[0m.user.height < [1;36mself[0m.attraction.min_height
    [1;34m14[0m:     [32mif[0m message != [31m[1;31m"[0m[31mSorry. [1;31m"[0m[31m[0m
    [1;34m15[0m:       message = message + [31m[1;31m"[0m[31m [1;31m"[0m[31m[0m
    [1;34m16[0m:     [32mend[0m
    [1;34m17[0m:     message = message + [31m[1;31m"[0m[31mYou are not tall enough to ride the #{self.attraction.name}[0m[31m.[1;31m"[0m[31m[0m
    [1;34m18[0m:   [32mend[0m
 => [1;34m19[0m:   binding.pry
    [1;34m20[0m:   message
    [1;34m21[0m: [32mend[0m

