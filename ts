
[1mFrom:[0m /home/ChristophGruener/ruby-music-library-cli-online-web-ft-021119/lib/music_library_controller.rb @ line 43 MusicLibraryController#list_artists:

    [1;34m41[0m: [32mdef[0m [1;34mlist_artists[0m
    [1;34m42[0m:   artists = [1;34;4mSong[0m.all.collect {|s| s.artist.name}.uniq.sort
 => [1;34m43[0m:   binding.pry
    [1;34m44[0m:   artists.each_with_index {|a| puts [31m[1;31m"[0m[31m#{index+1}[0m[31m. #{artist}[0m[31m[1;31m"[0m[31m[0m}
    [1;34m45[0m: 
    [1;34m46[0m: 
    [1;34m47[0m: 
    [1;34m48[0m:   [1;34m# sorted_list = [][0m
    [1;34m49[0m:   [1;34m# artist_names = (Song.all.collect {|s| s.artist.name}).sort[0m
    [1;34m50[0m:   [1;34m# # binding.pry[0m
    [1;34m51[0m:   [1;34m# artist_names.each do |artist|[0m
    [1;34m52[0m:   [1;34m#   # binding.pry[0m
    [1;34m53[0m:   [1;34m#   Song.all.each do |song|[0m
    [1;34m54[0m:   [1;34m#     # binding.pry[0m
    [1;34m55[0m:   [1;34m#       if song.artist.name == artist[0m
    [1;34m56[0m:   [1;34m#         sorted_list << song.artist.name[0m
    [1;34m57[0m:   [1;34m#       end[0m
    [1;34m58[0m:   [1;34m#   end[0m
    [1;34m59[0m:   [1;34m# end[0m
    [1;34m60[0m:   [1;34m# # binding.pry[0m
    [1;34m61[0m:   [1;34m#[0m
    [1;34m62[0m:   [1;34m# sorted_list.uniq.each_with_index do |artist, index|[0m
    [1;34m63[0m:   [1;34m#   # binding.pry[0m
    [1;34m64[0m:   [1;34m#   puts "#{index+1}. #{artist}"[0m
    [1;34m65[0m:   [1;34m# end[0m
    [1;34m66[0m: 
    [1;34m67[0m: [32mend[0m

