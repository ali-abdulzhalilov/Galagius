enum NodeStatus {
  Success,
  Failure,
  Running,
}

class BehaviorTree {
  private TreeNode root;
  boolean doDebugLogs;
  
  BehaviorTree(TreeNode root, boolean doDebugLogs) {
    this.root = root;
    this.root.tree = this;
    this.doDebugLogs = doDebugLogs;
  }
  
  void tick(Enemy actor) {
    root.tick(actor);
  }
  
  void reset(Enemy actor) {
    actor.data.clear();
    root.reset(actor);
  }
}

abstract class TreeNode {
  BehaviorTree tree;
  NodeStatus status;
  
  TreeNode() {
    status = NodeStatus.Failure;
  }
  
  void onInit(Enemy actor) {}
  
  abstract NodeStatus update(Enemy actor);
  
  void onTerminate(Enemy actor, NodeStatus status) {
    if (tree != null && tree.doDebugLogs)
      println(this +" "+ status);
  }
  
  NodeStatus tick(Enemy actor) {
    if (status != NodeStatus.Running) onInit(actor);
    status = update(actor);
    if (status != NodeStatus.Running) onTerminate(actor, status);
    return status;
  }
  
  void reset(Enemy actor) {}
}

abstract class CompositeNode extends TreeNode {
  String name;
  CompositeNode(String name) {
    this.name = name;
  }
  
  ArrayList<TreeNode> children = new ArrayList<TreeNode>();
  
  void addNode(TreeNode node) {
    node.tree = tree;
    children.add(node);
  }
  
  void onTerminate(Enemy actor, NodeStatus status) {
    if (tree != null && tree.doDebugLogs)
      println(name +" "+ status);
  }
  
  void reset(Enemy actor) {
    for (int i = 0; i < children.size(); i++)
      children.get(i).reset(actor);
  }
}

class Selector extends CompositeNode {
  Selector(String name) {super(name);}
  
  NodeStatus update(Enemy actor) {
    for (int i = 0; i < children.size(); i++) {
      NodeStatus childNodeStatus = children.get(i).tick(actor);
      if (childNodeStatus == NodeStatus.Running)
         return NodeStatus.Running;
      else if (childNodeStatus == NodeStatus.Success)
         return NodeStatus.Success;
    }
    return NodeStatus.Failure;
  }
}

class Sequence extends CompositeNode {
  Sequence(String name) {super(name);}
  
  NodeStatus update(Enemy actor) {
    for (int i = 0; i < children.size(); i++) {
      NodeStatus childNodeStatus = children.get(i).tick(actor);
      if (childNodeStatus == NodeStatus.Running)
         return NodeStatus.Running;
      else if (childNodeStatus == NodeStatus.Failure)
         return NodeStatus.Failure;
    }
    return NodeStatus.Success;
  }
}

abstract class Decorator extends TreeNode {
  TreeNode child;
  
  Decorator(TreeNode child) {
    this.child = child;
    child.tree = tree;
  }
  
  void reset(Enemy actor) {
    child.reset(actor);
  }
}

class Inverter extends Decorator {
  Inverter(TreeNode child) {super(child);}
  
  NodeStatus update(Enemy actor) {
    NodeStatus childNodeStatus = child.tick(actor);
    if (childNodeStatus == NodeStatus.Success)
      return NodeStatus.Failure;
    else if (childNodeStatus == NodeStatus.Failure)
      return NodeStatus.Success;
    else
      return childNodeStatus;
  }
}

class Succeeder extends Decorator {
  Succeeder(TreeNode child) {super(child);}
  
  NodeStatus update(Enemy actor) {
    child.tick(actor);
    return NodeStatus.Success;
  }
}