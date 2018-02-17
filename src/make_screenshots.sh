# Create the aseg without wm or cerebral gm
mri_binarize --i mri/aseg.mgz --o mri/aseg.sub.mgz \
--replace 2  0 --replace 3 0 --replace 41 0 --replace 42 0

# Create the screenshots
freeview -cmd /opt/src/freeview_batch_axl.txt
freeview -cmd /opt/src/freeview_batch_cor.txt
freeview -cmd /opt/src/freeview_batch_sag.txt

# Create montages
montage -mode concatenate \
axl205_a.png axl205_b.png \
axl201_a.png axl201_b.png \
axl197_a.png axl197_b.png \
-tile 2x3 -quality 100 axl_mont1.png

montage -mode concatenate \
axl193_a.png axl193_b.png axl181_a.png axl181_b.png \
axl189_a.png axl189_b.png axl177_a.png axl177_b.png \
axl185_a.png axl185_b.png axl173_a.png axl173_b.png \
-tile 4x3 -quality 100 axl_mont2.png

montage -mode concatenate \
axl169_a.png axl169_b.png axl157_a.png axl157_b.png \
axl165_a.png axl165_b.png axl153_a.png axl153_b.png \
axl161_a.png axl161_b.png axl149_a.png axl149_b.png \
-tile 4x3 -quality 100 axl_mont3.png

montage -mode concatenate \
axl145_a.png axl145_b.png axl133_a.png axl133_b.png \
axl141_a.png axl141_b.png axl129_a.png axl129_b.png \
axl137_a.png axl137_b.png axl125_a.png axl125_b.png \
-tile 4x3 -quality 100 axl_mont4.png

montage -mode concatenate \
axl121_a.png axl121_b.png axl109_a.png axl109_b.png \
axl117_a.png axl117_b.png axl105_a.png axl105_b.png \
axl113_a.png axl113_b.png axl101_a.png axl101_b.png \
-tile 4x3 -quality 100 axl_mont5.png

montage -mode concatenate \
axl093_a.png axl093_b.png axl081_a.png axl081_b.png \
axl089_a.png axl089_b.png axl077_a.png axl077_b.png \
axl085_a.png axl085_b.png axl073_a.png axl073_b.png \
-tile 4x3 -quality 100 axl_mont6.png

montage -mode concatenate \
axl069_a.png axl069_b.png axl057_a.png axl057_b.png \
axl065_a.png axl065_b.png axl053_a.png axl053_b.png \
axl061_a.png axl061_b.png axl049_a.png axl049_b.png \
-tile 4x3 -quality 100 axl_mont7.png

montage -mode concatenate \
cor205_a.png cor205_b.png \
cor201_a.png cor201_b.png \
cor197_a.png cor197_b.png \
-tile 2x3 -quality 100 cor_mont1.png

montage -mode concatenate \
cor193_a.png cor193_b.png cor181_a.png cor181_b.png \
cor189_a.png cor189_b.png cor177_a.png cor177_b.png \
cor185_a.png cor185_b.png cor173_a.png cor173_b.png \
-tile 4x3 -quality 100 cor_mont2.png

montage -mode concatenate \
cor169_a.png cor169_b.png cor157_a.png cor157_b.png \
cor165_a.png cor165_b.png cor153_a.png cor153_b.png \
cor161_a.png cor161_b.png cor149_a.png cor149_b.png \
-tile 4x3 -quality 100 cor_mont3.png

montage -mode concatenate \
cor145_a.png cor145_b.png cor133_a.png cor133_b.png \
cor141_a.png cor141_b.png cor129_a.png cor129_b.png \
cor137_a.png cor137_b.png cor125_a.png cor125_b.png \
-tile 4x3 -quality 100 cor_mont4.png

montage -mode concatenate \
cor121_a.png cor121_b.png cor109_a.png cor109_b.png \
cor117_a.png cor117_b.png cor105_a.png cor105_b.png \
cor113_a.png cor113_b.png cor101_a.png cor101_b.png \
-tile 4x3 -quality 100 cor_mont5.png

montage -mode concatenate \
cor093_a.png cor093_b.png cor081_a.png cor081_b.png \
cor089_a.png cor089_b.png cor077_a.png cor077_b.png \
cor085_a.png cor085_b.png cor073_a.png cor073_b.png \
-tile 4x3 -quality 100 cor_mont6.png

montage -mode concatenate \
cor069_a.png cor069_b.png cor057_a.png cor057_b.png \
cor065_a.png cor065_b.png cor053_a.png cor053_b.png \
cor061_a.png cor061_b.png cor049_a.png cor049_b.png \
-tile 4x3 -quality 100 cor_mont7.png

montage -mode concatenate \
cor045_a.png cor045_b.png cor033_a.png cor033_b.png \
cor041_a.png cor041_b.png cor029_a.png cor029_b.png \
cor037_a.png cor037_b.png cor025_a.png cor025_b.png \
-tile 4x3 -quality 100 cor_mont8.png

montage -mode concatenate \
sag205_a.png sag205_b.png \
sag201_a.png sag201_b.png \
sag197_a.png sag197_b.png \
-tile 2x3 -quality 100 sag_mont1.png

montage -mode concatenate \
sag193_a.png sag193_b.png sag181_a.png sag181_b.png \
sag189_a.png sag189_b.png sag177_a.png sag177_b.png \
sag185_a.png sag185_b.png sag173_a.png sag173_b.png \
-tile 4x3 -quality 100 sag_mont2.png

montage -mode concatenate \
sag169_a.png sag169_b.png sag157_a.png sag157_b.png \
sag165_a.png sag165_b.png sag153_a.png sag153_b.png \
sag161_a.png sag161_b.png sag149_a.png sag149_b.png \
-tile 4x3 -quality 100 sag_mont3.png

montage -mode concatenate \
sag145_a.png sag145_b.png sag133_a.png sag133_b.png \
sag141_a.png sag141_b.png sag129_a.png sag129_b.png \
sag137_a.png sag137_b.png sag125_a.png sag125_b.png \
-tile 4x3 -quality 100 sag_mont4.png

montage -mode concatenate \
sag121_a.png sag121_b.png sag109_a.png sag109_b.png \
sag117_a.png sag117_b.png sag105_a.png sag105_b.png \
sag113_a.png sag113_b.png sag101_a.png sag101_b.png \
-tile 4x3 -quality 100 sag_mont5.png

montage -mode concatenate \
sag093_a.png sag093_b.png sag081_a.png sag081_b.png \
sag089_a.png sag089_b.png sag077_a.png sag077_b.png \
sag085_a.png sag085_b.png sag073_a.png sag073_b.png \
-tile 4x3 -quality 100 sag_mont6.png

montage -mode concatenate \
sag069_a.png sag069_b.png sag057_a.png sag057_b.png \
sag065_a.png sag065_b.png sag053_a.png sag053_b.png \
sag061_a.png sag061_b.png sag049_a.png sag049_b.png \
-tile 4x3 -quality 100 sag_mont7.png

convert \
axl_mont1.png axl_mont2.png axl_mont3.png axl_mont4.png \
axl_mont5.png axl_mont6.png axl_mont7.png \
cor_mont1.png cor_mont2.png cor_mont3.png cor_mont4.png \
cor_mont5.png cor_mont6.png cor_mont7.png cor_mont8.png \
sag_mont1.png sag_mont2.png sag_mont3.png sag_mont4.png \
sag_mont5.png sag_mont6.png sag_mont7.png \
all.pdf

# Delete temporary files
rm axl[0-9][0-9][0-9]*.png cor[0-9][0-9][0-9]*.png sag[0-9][0-9][0-9]*.png *_mont[0-9].png
