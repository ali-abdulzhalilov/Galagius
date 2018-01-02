class NullNode extends TreeNode {
  NodeStatus update(Enemy actor) {
    println(actor + " does nothing");
    return NodeStatus.Running;
  }
  
  void reset(Enemy actor) {
    println(actor + " has reset");
  }
}

class MoveTo extends TreeNode {
  String targetTag;
  float distanceToSuccess;
  
  MoveTo(String targetTag, float distanceToSuccess) {
    this.targetTag = targetTag;
    this.distanceToSuccess = distanceToSuccess;
  }
  
  NodeStatus update(Enemy actor) {
    PVector target = (PVector)actor.data.get(targetTag);
    if (target != null) {
      float dist = dist(target.x, target.y, actor.pos.x, actor.pos.y);
      if (dist < distanceToSuccess) {
        return NodeStatus.Success;
      }
      else {
        float dirX = target.x - actor.pos.x;
        float dirY = target.y - actor.pos.y;
        actor.move(dirX, dirY);
        return NodeStatus.Running;
      }
    } else
      return NodeStatus.Failure;
  }
}

class GetRandomPoint extends TreeNode {
  String pointTag;
  
  GetRandomPoint(String pointTag) {
    this.pointTag = pointTag;
  }
  
  NodeStatus update(Enemy actor) {
    PVector point = new PVector(random(width), random(height));
    actor.data.put(pointTag, point);
    return NodeStatus.Success;
  }
}

class IsTooCloseToPoint extends TreeNode {
  String pointTag;
  float distance;
  
  IsTooCloseToPoint(String pointTag, float distance) {
    this.pointTag = pointTag;
    this.distance = distance;
  }
  
  NodeStatus update(Enemy actor) {
    PVector point = (PVector)actor.data.get(pointTag);
    if (point != null) {
      if (dist(point.x, point.y, actor.pos.x, actor.pos.y) < distance)
        return NodeStatus.Success;
      else
        return NodeStatus.Failure;
    } else
      return NodeStatus.Success;
  }
}