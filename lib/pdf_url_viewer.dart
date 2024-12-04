import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_url_viewer/api_service.dart';
import 'package:printing/printing.dart';

class PdfUrlViewer extends StatelessWidget {
  const PdfUrlViewer({
    super.key,
    required this.url,
    this.onComplete,
  });

  final String url;
  final VoidCallback? onComplete;

  Future<Uint8List> _fetchPdfContent() async {
    try {
      final data = await ApiService.instance.downloadPdf(url);
      return data ?? Uint8List(0);
    } catch (e) {
      print(e);
      return Uint8List(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      previewPageMargin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.zero,
      pdfPreviewPageDecoration: const BoxDecoration(color: Colors.white), //context.theme.appColors.white
      allowPrinting: false,
      allowSharing: false,
      useActions: false,
      canChangeOrientation: false,
      canDebug: false,
      canChangePageFormat: false,
      //   initialPageFormat: PdfPageFormat(100 * PdfPageFormat.mm, 120 * PdfPageFormat.mm),
      build: (format) async {
        onComplete?.call();
        return await _fetchPdfContent();
      },
      loadingWidget: _loadingWidget(Theme.of(context).colorScheme.primary),
      onError: (context, error) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oops!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(error.toString()),
          ],
        );
      },
    );
  }

  Widget _loadingWidget(Color loadingColor) {
    return Center(
      child: SizedBox(
        width: 35,
        height: 35,
        child: CircularProgressIndicator(
          color: loadingColor,
          backgroundColor: loadingColor.withOpacity(0.15),
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
