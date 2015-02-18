#--------------------------------------
# font family setup
#--------------------------------------
# base/base.rbにフォント関係のインスタンス変数あり
# @font_family             : 通常
# @monospace_font_family   : 等幅

# find_font_familyの引数はインスタンス変数でないと反映されない
@thinkami_slide_font = "07YasashisaGothicBold"
@font_family = find_font_family(@thinkami_slide_font)
#--------------------------------------



include_theme("image")
include_theme("table")

normal_font_size = @normal_font_size
small_font_size = @small_font_size
xx_small_font_size = @xx_small_font_size
@normal_font_size = screen_size(4 * Pango::SCALE)
@small_font_size = screen_size(3.3 * Pango::SCALE)
@xx_small_font_size = screen_size(2.5 * Pango::SCALE)
include_theme("default-text")
@normal_font_size = normal_font_size
@small_font_size = small_font_size
@xx_small_font_size = xx_small_font_size

x_large_font_size = @x_large_font_size
large_font_size = @large_font_size
normal_font_size = @normal_font_size
@x_large_font_size = screen_size(7 * Pango::SCALE)
@large_font_size = screen_size(4.5 * Pango::SCALE)
@normal_font_size = screen_size(3.5 * Pango::SCALE)

#--------------------------------------
# title-text setup
#--------------------------------------
# 07YasashisaGothicBoldにイタリックがないことから、
# Italicがあるとwarningを吐くので、Italicにしないトップスライドへと変更
# include_theme("default-title-text")
include_theme("thinkami-title-text")
#--------------------------------------

@x_large_font_size = x_large_font_size
@large_font_size = large_font_size
@normal_font_size = normal_font_size

#--------------------------------------
# title-slide setup
#--------------------------------------
# スライドタイトルの配置を修正
include_theme("thinkami-title-slide")
# include_theme("default-title-slide")
#--------------------------------------

#--------------------------------------
# slide setup
#--------------------------------------
# 罫線の編集
@default_headline_line_color = "#0066FF"
@default_headline_line_width = 5
include_theme("default-slide")

# ヘッドライン部分のセンタリング
match(Slide, HeadLine) do |headlines|
  headlines.each do |headline|
    headline.horizontal_centering = true
  end
end
#--------------------------------------


include_theme("default-description")
include_theme("default-preformatted")

match("**", PreformattedText) do |texts|
  texts.prop_set("size", screen_size(2.8 * Pango::SCALE))
end

#--------------------------------------
# slide setup
#--------------------------------------
# item-markはデフォルトのを修正する
# @default_item1_mark_type ||= "check"    # 無さそう(空白になる)
@default_item1_mark_type ||= "rectangle"  # 四角
@default_item2_mark_type ||= "circle"     # 円
@default_item3_mark_type ||= "dash"       # 直線
@default_enum_item1_mark_type ||= "circle"
@default_enum_item2_mark_type ||= "circle"
@default_description_item1_mark_type ||= "check"
@default_block_quote_item1_mark_type ||= "check"

@default_item1_mark_color ||= "#0066FF"
@default_item2_mark_color ||= "#0099FF"
@default_item3_mark_color ||= "#0066FF"
@default_enum_item1_mark_color ||= "#333"
@default_enum_item2_mark_color ||= "#666"
@default_description_item1_mark_color ||= "#ff9933"
@default_block_quote_item1_mark_color ||= "#ff9933"


include_theme("default-item-mark")
# include_theme("rabbit-item-mark")
#--------------------------------------

@powered_by_text = "Powered by Rabbit #{VERSION}"
include_theme("powered-by")

if print?
  include_theme("slide-number")
else
  include_theme("image-slide-number")

  @image_timer_limit ||= canvas.allotted_time || 5 * 60
  include_theme("image-timer")
end

@lightning_talk_proc_name = "thinkami"
@lightning_talk_as_large_as_possible = true
include_theme("lightning-talk-toolkit")

match(Slide) do |slides|
  slides.each do |slide|
    if slide.lightning_talk?
      slide.lightning_talk
    end
  end
end
