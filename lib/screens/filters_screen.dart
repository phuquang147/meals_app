import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;

  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {String title,
      String subtitle,
      bool currentValue,
      Function onChangeHandler}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: (value) {
        onChangeHandler(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              });
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals',
                  currentValue: _glutenFree,
                  onChangeHandler: (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include lactose-free meals',
                  currentValue: _lactoseFree,
                  onChangeHandler: (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  currentValue: _vegetarian,
                  onChangeHandler: (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals',
                  currentValue: _vegan,
                  onChangeHandler: (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
