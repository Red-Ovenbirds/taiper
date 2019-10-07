# taiper
**Taiper** is a layout framework that offers building block widgets called ***Clayblocks*** that can be stacked vertically inside a ***TaipaContainer*** widget.

There are *Clayblocks* for:
 - Text
   - title
   - body
   
 - Image
   - local
   - bitmap
   - URL
   
 - Video
   - local
   - URL
   
 - Audio
   - local
   - URL
 
Every Clayblock and the TaipaContainer are ***Stylizable***, meaning their appearance can be customized.
You can customize a Clayblock class default appearance using the ***TaipaTheme*** singleton.
If you customize the styling of a Clayblock **instance** these changes **override** the ones declared on TaipaTheme.
