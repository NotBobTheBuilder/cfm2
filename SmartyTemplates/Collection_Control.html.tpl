<!--SM:include file="Common_Object_Header.tpl":SM-->
    <div data-role="content">
        <div data-role="collapsible-set" id="theobject" data-theme="c" data-content-theme="d">
            <!--SM:foreach $renderPage as $object:SM-->
                <div data-role="collapsible"><h3>Slots</h3>
                    <div id="slots" data-role="collapsible-set" data-inset="false"> 
                    <!--SM:foreach $object.arrSlots as $slot:SM-->
                        <div id="slot-<!--SM:$slot.intSlotID:SM-->" data-role="collapsible" data-inset="false" data-content-theme="d" data-iconpos="right"><h3>
                        (ID: <!--SM:$slot.intSlotID:SM-->) <!--SM:$slot.dateStart:SM--> <!--SM:$slot.timeStart:SM--> - <!--SM:$slot.timeEnd:SM-->
                            </h3>
                        </div>
                    <!--SM:/foreach:SM-->
                        <div data-role="collapsible" data-inset="false" data-theme="a" data-iconpos="right"><h3>New</h3>
                        <form id="slot-new" action="<!--SM:$SiteConfig.base_url:SM-->rest/slot/">
                        <fieldset data-role="fieldcontain">
                            <label for="dateStart">Start Date:</label>
                            <input id="dateStart" type="date" />
                        </fieldset>
                        <fieldset data-role="fieldcontain">
                            <label for="dateEnd">End Date:</label>
                            <input id="dateEnd" type="date" />
                        </fieldset>
                        </fieldset>
                        <fieldset data-role="fieldcontain">
                            <label for="timeStart">Start Time:</label>
                            <input id="timeStart" type="time" />
                        </fieldset>
                        <fieldset data-role="fieldcontain">
                            <label for="timeEnd">End Time:</label>
                            <input id="timeEnd" type="time" />
                        </fieldset>
                        <fieldset data-role="controlgroup" data-type="horizontal">
                            <input type="submit" data-mini="true" data-inline="true" data-role="button" value="Create" />
                            <input type="reset" data-mini="true" data-inline="true" data-role="button" value="Clear" />
                        </fieldset>
                        </form>
                        <script type="text/javascript">
                        $(function() {
                            var frm = $('#slot-new');
                            frm.submit(function(e) {
                                $.ajax({
                                    type: frm.attr('method'),
                                    url: frm.attr('action'),
                                    data: frm.serialize(),
                                    success: function (data) {
                                        $.mobile.changePage(
                                            "<!--SM:$SiteConfig.base_url:SM-->control",
                                            {
                                              allowSamePageTransition : true,
                                              transition              : 'none',
                                              showLoadMsg             : false,
                                              reloadPage              : true
                                            }
                                        );
                                    }
                                });
                                e.preventDefault();
                                return false;
                            });
                        });
                        </script>
                        </div>
                    </div>
                </div>
                <div data-role="collapsible"><h3>Rooms</h3>
                    <div id="rooms" data-role="collapsible-set" data-inset="false"> 
                    <!--SM:foreach $object.arrRooms as $room:SM-->
                        <div id="room-<!--SM:$room.intSlotID:SM-->" data-role="collapsible" data-inset="false" data-content-theme="d" data-iconpos="right"><h3>
                        (ID: <!--SM:$room.intRoomID:SM-->) <!--SM:$room.strRoom:SM-->
                            </h3>
                        </div>
                    <!--SM:/foreach:SM-->
                        <div id="room/new" data-role="collapsible" data-inset="false" data-theme="a" data-iconpos="right"><h3>New</h3>
                        <form id="room" action="/rest/room/" method="post">
                        </form>
                        </div>
                    </div>
                </div>
            <!--SM:/foreach:SM-->
        </div>
    </div>
<!--SM:include file="Common_Object_Footer.tpl":SM-->
