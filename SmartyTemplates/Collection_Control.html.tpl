<!--SM:include file="Common_Object_Header.tpl":SM-->
    <div data-role="content">
        <div data-role="collapsible-set" id="theobject" data-theme="c" data-content-theme="d">
            <!--SM:foreach $renderPage as $object:SM-->
                <div data-role="collapsible"><h3>Event</h3>
                    <ul data-role="listview">
                    <!--SM:foreach $SiteConfig as $k=>$v:SM-->
                        <li id="cfg-<!--SM:$k:SM-->">
                        <!--SM:$k:SM-->: <!--SM:$v:SM-->
                        </li>
                    <!--SM:/foreach:SM-->
                    </ul>
                </div>
                <div data-role="collapsible"><h3>Slots</h3>
                    <ul data-role="listview">
                    <!--SM:foreach $object.arrSlots as $slot:SM-->
                        <li id="slot-<!--SM:$slot.intSlotID:SM-->">
                        (ID: <!--SM:$slot.intSlotID:SM-->) <!--SM:$slot.dateStart:SM--> <!--SM:$slot.timeStart:SM--> - <!--SM:$slot.timeEnd:SM-->
                        </li>
                    <!--SM:/foreach:SM-->
                    </ul>
                </div>
                <div data-role="collapsible"><h3>Rooms</h3>
                    <ul data-role="listview">
                    <!--SM:foreach $object.arrRooms as $room:SM-->
                        <li id="room-<!--SM:$room.intRoomID:SM-->">
                        (ID: <!--SM:$room.intRoomID:SM-->) <!--SM:$room.strRoom:SM-->
                        </li>
                    <!--SM:/foreach:SM-->
                    </ul>
                </div>
                <div data-role="collapsible"><h3>Slot Locks</h3>
                    <ul data-role="listview">
                    <!--SM:foreach $object.arrDefaultSlotType as $dst:SM-->
                        <li id="dst-<!--SM:$dst.intDefaultSlotTypeID:SM-->">
                        (ID: <!--SM:$dst.intDefaultSlotTypeID:SM-->) <!--SM:$dst.strDefaultSlotType:SM-->
                        </li>
                    <!--SM:/foreach:SM-->
                    </ul>
                </div>
            <!--SM:/foreach:SM-->
        </div>
    </div>
<!--SM:include file="Common_Object_Footer.tpl":SM-->
