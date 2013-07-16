<?php
/**
 * CampFire Manager is a scheduling tool predominently used at BarCamps to 
 * schedule talks based, mainly, on the number of people attending each talk
 * receives.
 *
 * PHP version 5
 *
 * @category Default
 * @package  CampFireManager2
 * @author   Jon Spriggs <jon@sprig.gs>
 * @license  http://www.gnu.org/licenses/agpl.html AGPLv3
 * @link     https://github.com/CampFireManager/cfm2 Version Control Service
 */
/**
 * This serves as a control panel for admins to manage the event
 *
 * @category Collection_Control
 * @package  CampFireManager2
 * @author   Jack Wearden <jack@jackwearden.co.uk>
 * @license  http://www.gnu.org/licenses/agpl.html AGPLv3
 * @link     https://github.com/CampFireManager/cfm2 Version Control Service
 */

class Collection_Control extends Abstract_GenericCollection
{
    /**
     * Collect the data for this collection
     *
     * @return Collection_Control
     */
    function __construct()
    {
        $this->arrData['arrRooms'] = array();
        $this->arrData['arrSlots'] = array();

        foreach (Object_Room::brokerAll() as $k => $v) {
            array_push($this->arrData['arrRooms'], $v->getData());
        }
        foreach (Object_Slot::brokerAll() as $k => $v) {
            array_push($this->arrData['arrSlots'], $v->getData());
        }
        return $this;
    }
}
