
class TicketData {
  final String id;
  final String title;
  final String ownerName;
  final String ownerImage;
  final String type;
  final String forwardTo;
  final String assignedToName;
  final String assignedToImage;

  TicketData({
    required this.id,
    required this.title,
    required this.ownerName,
    required this.ownerImage,
    required this.type,
    required this.forwardTo,
    required this.assignedToName,
    required this.assignedToImage,
  });
}
