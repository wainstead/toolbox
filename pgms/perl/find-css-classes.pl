#!/usr/bin/perl


while ($input_file = <DATA>) {
    chomp $input_file;
    local $/ = '>';
    open INPUTFILE, "< $input_file" or die $!;
    while ($string = <INPUTFILE>) {
        if ($string =~ m%(class=[^\s]+)%) {
            $match = $&;
            $match =~ s/>.*?$//;
            #$match =~ s/<.*?$//;
            #print "$input_file\n" if ($match eq 'class=');
            #if ( ! exists($classcount{$match}) ) { $classcount{$match} = []; }
            $classcount{$match}{$input_file}++;
            #$count++;
        }
    }
    #last if $count > 2000;
}


foreach $match (keys %classcount) {
    foreach $filename (  sort keys %{$classcount{$match}}  ) {
        print "$match,$filename,$classcount{$match}{$filename}\n";
    }
}

#print "Number of unique classes: ", scalar(keys %classcount), "\n";


__END__
manifest.inc
classes/AddressBook.class.inc
classes/DBConn.class.inc
classes/GoodStanding.class.inc
classes/HTMLParser.class.inc
classes/Info.class.inc
classes/Premium.class.inc
classes/Profile.class.inc
classes/Stats.class.inc
classes/Usage.class.inc
html/userData.inc
layout/12days.inc
layout/adminbox.inc
layout/alert.inc
layout/breadcrumb.inc
layout/commentbox.inc
layout/commentboxtop.inc
layout/commentdraw.inc
layout/navigator.inc
layout/navphoto.inc
layout/navtablebegin.inc
layout/searchdraw.inc
layout/slide.inc
setup/check.inc
setup/config_data.inc
setup/constants.inc
setup/defaults.inc
setup/fcconfirm.inc
setup/fcwrite.inc
setup/functions.inc
tools/include/main.inc
tools/include/plugin_rowdata.inc
hot-video.php
view_photo.php
holiday.php
hot-videos.php
loginpage.php
welcome.php
manage_users.php
Version.php
mass_add.php
add_comment.php
mobilephone.php
add_movie.php
modify_user.php
add_photos.php
moveTmpVideoImage.php
move_album.php
address_book.php
move_photo.php
adv_search.php
ads/album_600.php
ads/contest_600.php
ads/gallery_600.php
ads/share_600.php
ads/slideshow_600.php
ads/video_600.php
ads/intersticial.php
ajax.php
multi_create_user.php
album_permissions.php
my_profile.php
albums.php
new_password.php
albumscroll.php
ampira.local.php
no-ads.php
no-script.php
available.php
onthego.php
beta_bug.php
delete_album.php
cameras.php
outlet.php
captionator.php
permission_denied.php
change_keywords.php
ajax/itreelib/func.ax.php
ajax/itreelib/func.base.php
ajax/lib/func.axcart.php
club.php
photo_owner.php
copy_photo.php
points.php
poll_properties.php
create_user.php
poll_results.php
decline_invite.php
process_email.php
profile_picture.php
view_album.php
promotion.php
delete_photo.php
publish_xp.php
delete_user.php
publish_xp_docs.php
register.php
do_command.php
rename_album.php
easy_upload-first.php
reorder_album.php
easy_upload.php
reset_votes.php
easy_upload_j.php
resize_photo.php
ecard.php
edit_appearance.php
rotate_photo.php
edit_caption.php
edit_field.php
save_photos.php
edit_thumb.php
search.php
email_friend.php
email_invite.php
select_share.php
error404.php
send_ecard.php
extra_fields.php
session.php
share.php
signup.php
fx_add_photo.php
slideshow.php
slideshow_low.php
gallery_remote2.php
sort_album.php
invite_friends.php
space.php
template.php
join_club.php
classes/Album.php
classes/AlbumDB.php
classes/AlbumItem.php
classes/Comment.php
classes/Database.php
classes/EverybodyUser.php
classes/Image.php
classes/LoggedInUser.php
classes/NobodyUser.php
classes/User.php
classes/UserDB.php
classes/class.idb.php
classes/class.phpmailer.php
classes/class.smtp.php
classes/gallery/User.php
classes/gallery/UserDB.php
classes/phpbb/User.php
classes/phpbb/UserDB.php
classes/remote/GalleryRemoteProperties.php
upgrade_album.php
links.php
upgrade_users.php
login.php
util.php
import_photos.php
retrieve_from_attic.php
address_book_extracted.php
docs/context-help/login.php
docs/context-help/register.php
docs/context-help/search.php
docs/context-help/slideshow.php
ecard/preview.code.php
ecard/inc.header.php
ecard/frame.display.php
ecard/preview.display.php
editor/class.cropper.php
editor/confirmation.code.php
editor/confirmation.display.php
editor/cropping.display.php
editor/cropping_save.code.php
editor/func.effect.php
editor/renderimage.code.php
errors/configmode.php
errors/reconfigure.php
html/exitpopup.php
html_wrap/wrapper.footer.default
html_wrap/album.footer.default
html_wrap/album.header.default
html_wrap/gallery.adminopt.default
html_wrap/gallery.header.default
html_wrap/general.adminopt.default
html_wrap/right.admin.default
html_wrap/gallery.footer.default
html_wrap/slideshow.adminopt.default
html_wrap/generic.header.default
html_wrap/new.profile.default
html_wrap/photo.header.default
html_wrap/rightadd.admin.default
html_wrap/rss.links.default
html_wrap/search.form.default
html_wrap/search.header.default
html_wrap/profile.box.default
html_wrap/search.default
html_wrap/search.footer.default
html_wrap/slideshow.footer.default
html_wrap/slideshow.header.default
html_wrap/tabs.all.default
html_wrap/album.adminopt.default
html_wrap/all.header.default
html_wrap/club.default
html_wrap/frames.default
html_wrap/gifts.header.default
html_wrap/poll.adminopt.default
html_wrap/prints.header.default
html_wrap/photo.adminopt.default
includes/left-bar-sc.php
points/class.rewards.php
points/pointSummary.code.php
points/remind.code.php
points/func.php
points/index.display.php
points/inviteSummary.display.php
points/pointSummary.display.php
setup/backup_albums.php
setup/check_mail.php
setup/check_versions.php
setup/diagnostics.php
setup/merged.php
setup/session_test.php
setup/themetables.php
setup/shortform.php
tools/build_manifest.php
points_address_book.php
pixenate/edit_picture.php
pixenate/sample.php
your_coupon.php
progress_uploading.php
user_preferences.php
view_ecard.php
violation_pop.php
intersticial.php
view_comments.php
new_add.php
order_prints.php
gifts/cards/gc_add_message.php
gifts/cards/gc_quantities.php
gifts/cards/recrop.php
gifts/cards/gc_includes.php
gifts/cards/gc_add_frame.php
gifts/cards/makecard.php
gifts/cards/select_photo.php
gifts/ez_sql.php
gifts/makecard.php
gifts/crop_picture.php
gifts/crop_preview.php
gifts/products.php
gifts/quantity.php
gifts/select_photo.php
gifts/select_cd.php
gifts/calendars/web_myphotoalbum/calendar_create.php
gifts/giftspagestemplate.php
gifts/classes.php
gifts/shared_code.php
gifts/folded_cards/add_message.php
gifts/folded_cards/pick_border.php
gifts/folded_cards/pick_border_preview.php
gifts/folded_cards/quantity.php
init.php
no-points.php
share_address_book.php
valentines.php
view_photo_properties.php
other_tools.php
create_or_add.php
select_photo.php
not-in-good-standing.php
