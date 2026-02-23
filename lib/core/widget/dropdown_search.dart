import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// A dropdown-like widget that opens a full screen search picker
class QDropdownSearch<T> extends StatefulWidget {
  final String label;
  final String? hint;
  final T? value;
  final String? displayText;
  final List<QDropdownSearchItem<T>> items;
  final void Function(T?)? onChanged;
  final Widget? prefixIcon;
  final bool enabled;
  final String searchHint;
  final String Function(QDropdownSearchItem<T>)? searchableText;
  final String? Function(T?) validator;

  /// If true, automatically selects the first item when the widget is built
  /// and the current value is null. Defaults to false.
  final bool autoSelectFirstItem;

  const QDropdownSearch({
    super.key,
    required this.label,
    this.hint,
    this.value,
    this.displayText,
    required this.items,
    this.onChanged,
    this.prefixIcon,
    this.enabled = true,
    this.searchHint = 'Search...',
    this.searchableText,
    required this.validator,
    this.autoSelectFirstItem = false,
  });

  @override
  State<QDropdownSearch<T>> createState() => _QDropdownSearchState<T>();
}

class _QDropdownSearchState<T> extends State<QDropdownSearch<T>> {
  @override
  void initState() {
    super.initState();
    // Auto-select first item if enabled and no value is set
    if (widget.autoSelectFirstItem &&
        widget.value == null &&
        widget.items.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(widget.items.first.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Validate if validator exists
    final errorText = widget.validator.call(widget.value);
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: defaultFormFieldFontSize, fontWeight: FontWeight.w500),
        ), 
        const SizedBox(height: 8),
        InkWell(
          onTap: widget.enabled
              ? () async {
                  final result = await Navigator.push<T>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => _DropdownSearchPicker<T>(
                        title: widget.label,
                        items: widget.items,
                        selectedValue: widget.value,
                        searchHint: widget.searchHint,
                        searchableText: widget.searchableText,
                      ),
                    ),
                  );
                  if (result != null || result == null) {
                    widget.onChanged?.call(result);
                  }
                }
              : null,
          borderRadius: BorderRadius.circular(formFieldRadius),
          child: Container(
            padding: defaultFormWidgetPadding,
            decoration: BoxDecoration(
              border: Border.all(
                color: hasError ? dangerColor : Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(formFieldRadius),
              color: widget.enabled ? Colors.white : Colors.grey[100],
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null) ...[
                  widget.prefixIcon!,
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    widget.displayText ?? widget.hint ?? 'Select...',
                    style: TextStyle(
                      fontSize: defaultFormFieldFontSize,
                      color: widget.displayText != null
                          ? Colors.black87
                          : Colors.grey[600],
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: defaultFormFieldIconSize,
                  color: widget.enabled ? Colors.grey[600] : Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 6),
          Text(
            errorText,
            style: const TextStyle(color: dangerColor, fontSize: 12),
          ),
        ],
      ], 
    );
  }
}

/// Item model for QDropdownSearch
class QDropdownSearchItem<T> {
  final T value;
  final String title;
  final dynamic subtitle;
  final Widget? leading;

  const QDropdownSearchItem({
    required this.value,
    required this.title,
    this.subtitle,
    this.leading,
  });
}

/// Full screen picker for QDropdownSearch
class _DropdownSearchPicker<T> extends StatefulWidget {
  final String title;
  final List<QDropdownSearchItem<T>> items;
  final T? selectedValue;
  final String searchHint;
  final String Function(QDropdownSearchItem<T>)? searchableText;

  const _DropdownSearchPicker({
    required this.title,
    required this.items,
    this.selectedValue,
    required this.searchHint,
    this.searchableText,
  });

  @override
  State<_DropdownSearchPicker<T>> createState() =>
      _DropdownSearchPickerState<T>();
}

class _DropdownSearchPickerState<T> extends State<_DropdownSearchPicker<T>> {
  final _searchController = TextEditingController();
  List<QDropdownSearchItem<T>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items.where((item) {
          final searchText =
              widget.searchableText?.call(item) ??
              '${item.title} ${item.subtitle ?? ''}';
          return searchText.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select ${widget.title}'), centerTitle: true),
      body: Column(
        children: [
          // Search field
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: widget.searchHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(formFieldRadius),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),

          // Clear selection option
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.clear, color: Colors.grey),
            ),
            title: const Text('No selection'),
            subtitle: const Text('Clear current selection'),
            selected: widget.selectedValue == null,
            selectedTileColor: Colors.teal.withValues(alpha: 0.1),
            onTap: () => Navigator.pop(context, null),
          ),
          const Divider(height: 1),

          // Items list
          Expanded(
            child: _filteredItems.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 48, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No results found',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount: _filteredItems.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      final isSelected = widget.selectedValue == item.value;

                      return ListTile(
                        leading:
                            item.leading ??
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.teal.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.teal,
                              ),
                            ),
                        title: Text(item.title),
                        subtitle: item.subtitle != null
                            ? Text(item.subtitle!.toString())
                            : null,
                        trailing: isSelected
                            ? const Icon(Icons.check_circle, color: Colors.teal)
                            : null,
                        selected: isSelected,
                        selectedTileColor: Colors.teal.withValues(alpha: 0.1),
                        onTap: () => Navigator.pop(context, item.value),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
