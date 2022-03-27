if(PlaceMeeting(Enemy)){
    var _hit=Nearest(Enemy);
    Enemy.hp-=damage;
    Destroy();
}
