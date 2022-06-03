class Tasks{
  final int? id;
  final String? task;
  final String? time;
  final String? date;
  final String? status;
  final String? priority;

  Tasks({this.id,this.task,this.time,this.date,this.status,this.priority});

  factory Tasks.fromMap(Map<String, dynamic> json) => new Tasks(
    id: json['id'],
    task: json['task'],
    time: json['time'],
    date: json['date'],
    status: json['status'],
    priority: json['priority'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'time': time,
      'date': date,
      'status': status,
      'priority': priority,
    };
  }
}