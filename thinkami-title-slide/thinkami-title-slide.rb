match(TitleSlide) do |slides|
  # 
  slides.vertical_centering = true

  slides.margin_left = @margin_left
  slides.margin_right = @margin_right
  slides.margin_top = @margin_top
  slides.margin_bottom = @margin_bottom
end





#--------------------------------------
# Title margin setup
#--------------------------------------
# match(TitleSlide, Title) do |titles|
#   titles.margin_bottom = @space
# end
#--------------------------------------

#--------------------------------------
# Subtitle margin setup
#--------------------------------------
match(TitleSlide, Subtitle) do |subtitles|
  subtitles.margin_top = @space
end
#--------------------------------------

#--------------------------------------
# Author setup
#--------------------------------------
match(TitleSlide, Author) do |authors|
  # horizontal_centeringを解除しないと、alignが反映されない
  authors.horizontal_centering = false
  authors.align = :right

  authors.margin_top = @space * 15
  authors.margin_bottom = @space * 2
end
#--------------------------------------

#--------------------------------------
# Institution setup
#--------------------------------------
match(TitleSlide, Institution) do |institution|
  institution.horizontal_centering = false
  institution.align = :right
end
#--------------------------------------