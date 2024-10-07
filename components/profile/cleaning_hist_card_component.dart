import 'package:flutter/material.dart';

class CleaningCard extends StatelessWidget {
  final Map<String, String> history;

  const CleaningCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF28A745)),
          borderRadius: BorderRadius.circular(10), 
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${history['name']} ${history['id']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      history['status']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.cleaning_services_outlined,
                            color: Color(0xFF28A745), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          history['type']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined,
                            color: Color(0xFF28A745), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          history['date']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.access_time_outlined,
                            color: Color(0xFF28A745), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          history['time']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            color: Color(0xFF28A745), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          history['address']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF28A745),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          history['price']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, color: Color(0xFF28A745)),
            ],
          ),
        ),
      ),
    );
  }
}
