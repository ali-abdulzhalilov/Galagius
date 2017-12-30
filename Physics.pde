static class Physics {

  static boolean isPointInCircle(PVector point, PVector center, float radius) {
    return dist(point.x, point.y, center.x, center.y) < radius;
  }
  
  static boolean isCirclesTouch(PVector pointA, float radiusA, PVector pointB, float radiusB) {
    return dist(pointA.x, pointA.y, pointB.x, pointB.y) < radiusA+radiusB;
  }

}