<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

use App\Models\Document;
use App\DocumentType;

class DocumentTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_can_create_document_with_valid_type()
    {
        $document = Document::factory()->create([
            'type' => DocumentType::WILL->value,
        ]);

        $this->assertEquals(DocumentType::WILL, $document->type);
    }

    public function test_it_can_create_doc_with_other_valid_type()
    {
        $document = Document::factory()->create([
            'type' => DocumentType::POWER_OF_ATTORNEY->value,
        ]);

        $this->assertEquals(DocumentType::POWER_OF_ATTORNEY, $document->type);
    }
}
