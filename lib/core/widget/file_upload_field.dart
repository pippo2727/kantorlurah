import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// Reusable file/image upload field.
/// Lets user pick from gallery or camera, shows inline preview,
/// and exposes the selected [XFile] via [onChanged].
class FileUploadField extends StatefulWidget {
  final String? label;
  final XFile? initialFile;
  final String? existingUrl; // show a URL thumbnail if no local file yet
  final void Function(XFile? file) onChanged;
  final bool allowPdf;

  const FileUploadField({
    super.key,
    this.label,
    this.initialFile,
    this.existingUrl,
    required this.onChanged,
    this.allowPdf = false,
  });

  @override
  State<FileUploadField> createState() => _FileUploadFieldState();
}

class _FileUploadFieldState extends State<FileUploadField> {
  XFile? _file;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _file = widget.initialFile;
  }

  Future<void> _pick(ImageSource source) async {
    final picked = await _picker.pickImage(
      source: source,
      imageQuality: 75,
    );
    if (picked != null) {
      setState(() => _file = picked);
      widget.onChanged(picked);
    }
  }

  void _clear() {
    setState(() => _file = null);
    widget.onChanged(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textSecondaryColor,
            ),
          ),
          const SizedBox(height: 6),
        ],
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(formFieldRadius),
            border: Border.all(
              color: _file != null ? primaryColor : Colors.grey[350]!,
              width: _file != null ? 1.5 : 1,
            ),
          ),
          child: _file != null
              ? _buildPreview()
              : _buildEmpty(context),
        ),
      ],
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(formFieldRadius),
      onTap: () => _showSourceSheet(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Icon(Icons.cloud_upload_outlined,
                size: 36, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              'Ketuk untuk menambah lampiran',
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              'Foto/Gambar (JPG, PNG)',
              style: TextStyle(color: Colors.grey[400], fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
    final isImage = _isImageFile(_file!.name);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(formFieldRadius - 1),
          child: isImage
              ? Image.file(
                  File(_file!.path),
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.insert_drive_file,
                          color: Colors.blueGrey, size: 32),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          _file!.name,
                          style: const TextStyle(
                              fontSize: 12, color: textSecondaryColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: _clear,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          right: 6,
          child: GestureDetector(
            onTap: () => _showSourceSheet(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: const Text('Ganti',
                  style: TextStyle(color: Colors.white, fontSize: 11)),
            ),
          ),
        ),
      ],
    );
  }

  void _showSourceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.photo_camera, color: primaryColor),
              title: const Text('Ambil Foto dari Kamera'),
              onTap: () {
                Navigator.pop(context);
                _pick(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: primaryColor),
              title: const Text('Pilih dari Galeri'),
              onTap: () {
                Navigator.pop(context);
                _pick(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  bool _isImageFile(String name) {
    final ext = name.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(ext);
  }
}
