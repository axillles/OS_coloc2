import 'package:flutter/material.dart';
import 'package:hackathon/data/addresses.dart';
import 'package:hackathon/models/address.dart';
import 'package:hackathon/screens/address_details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<Address> _filteredAddresses = addresses;

  @override
  void initState() {
    super.initState();
    _filteredAddresses = addresses; // Инициализируем список
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredAddresses = addresses
          .where((address) => address.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Найти...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredAddresses.length,
        itemBuilder: (context, index) {
          final address = _filteredAddresses[index];
          return ListTile(
            title: Text(address.name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddressDetailsScreen(address: address),
              ),
            ),
          );
        },
      ),
    );
  }
}