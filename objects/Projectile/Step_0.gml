if(PlaceMeeting(Enemy)){
    var _hit=Nearest(Enemy);
    _hit.hp-=damage;
    Destroy();
}
